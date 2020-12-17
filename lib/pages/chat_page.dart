import 'package:RanMall_flutter/model/shopcar_model.dart';
import 'package:RanMall_flutter/pages/widget/chat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
// import 'package:socket_io/socket_io.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'dart:core';
// import 'signaling.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';



// final List<ChatMessageModel> messages  = [
//   ChatMessageModel(messageType: MessageType.receive, mediaType: MediaType.text, content: '师德师风的粉红色的覅和速度发贺岁档符合度封ID水电费苏打粉hi速度法华寺U盾还是闪电发货四U盾付伙食费'),
//   ChatMessageModel(messageType: MessageType.send, mediaType: MediaType.text, content: 'sddsdssdds'),
//   ChatMessageModel(messageType: MessageType.receive, mediaType: MediaType.image, content: 'sddsdssdds'),
//   ChatMessageModel(messageType: MessageType.send, mediaType: MediaType.text, content: '师德师风的粉红色的覅和速度发贺岁档符合度封ID水电费苏打粉hi速度法华寺U盾还是闪电发货四U盾付伙食费师德师风的粉红色的覅和速度发贺岁档符合度封ID水电费苏打粉hi速度法华寺U盾还是闪电发货四U盾付伙食费师德师风的粉红色的覅和速度发贺岁档符合度封ID水电费苏打粉hi速度法华寺U盾还是闪电发货四U盾付伙食费'),
//   ChatMessageModel(messageType: MessageType.receive, mediaType: MediaType.text, content: 'sddsdssdds'),
//   ChatMessageModel(messageType: MessageType.receive, mediaType: MediaType.video, content: 'sddsdssdds'),
// ];

IO.Socket channel;

//socket.io 连接
class ChatPage extends StatefulWidget {

  ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _controller = new TextEditingController();

  //webrtc 相关
  RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  RTCPeerConnection _peerConnection;
  MediaStream _localStream;

  MediaStream myMediaStream;

  //定义对等连接
  RTCPeerConnection _my_peerConnection;

  //定义对等连接配置(键值对)
  var configuration = <String, dynamic>{
    'iceServers': [{'url': 'stun:stun.l.google.com:19302'},]
  };

  final Map<String, dynamic> _config = {
    'mandatory': {},
    'optional': [
      {'DtlsSrtpKeyAgreement': true},
    ]
  };

  //定义offer配置
  final offer = <String, dynamic>{
    'mandatory':{
                  'OfferToReceiveAudio': true,
                  'OfferToReceiveVideo': true,
                },
  };

  @override
  Future<void> initState() { 
    super.initState();
    print('----');

    // IO.Socket socket = IO.io('http://localhost:8080');
    // socket.onConnect((_) {
    //  print('connect');
    //  socket.emit('msg', 'test');
    // });
    // // socket.on('event', (data) => print(data));
    // // socket.onDisconnect((_) => print('disconnect'));
    // // socket.on('fromServer', (_) => print(_));

    // socket.on('connect', (data) => print(data));

    //对等连接对象
    _createPC();
    // 监听socket
    _listenWebSocket();
    
    initRenderers();
  }

  _createPC() async {
    //对等连接对象------------------------------------
    _my_peerConnection = await createPeerConnection({...configuration,
      ...{}
    }, _config);

    //---ICE处理----有连接的候选人
     _my_peerConnection.onIceCandidate = (RTCIceCandidate candidate) {
      if (candidate != null) {
        Map<String,dynamic> sdpDic = {'userId':"flutter",
                                'msgType':0x03,
                                'id' : candidate.sdpMid,
                             'label':candidate.sdpMlineIndex,
                             'candidate':candidate.candidate};
        // print(sdpDic);
        channel.emitWithBinary('broadcast',[sdpDic]);
      } else {

      }
    };

    _my_peerConnection.onTrack = (event) {
      // print('onTrack');
      // _remoteRenderer.srcObject = event.streams[0];
    };

    _my_peerConnection.onAddStream = (stream) {
      // print('onAddStream');
      print(stream);
      myMediaStream = stream;
      setState(() {
        // _localRenderer.srcObject = myMediaStream;
        _remoteRenderer.srcObject = myMediaStream;
      });
    };

    _my_peerConnection.onAddTrack = (stream,track) {
    };

    _my_peerConnection.onSignalingState = (state) {
      if (state == RTCSignalingState.RTCSignalingStateHaveRemoteOffer) {
        // _sendAnswer();
      }

      if (state == RTCSignalingState.RTCSignalingStateHaveLocalOffer) {

      }
    };

    _my_peerConnection.onConnectionState = (state) {
    };

    _my_peerConnection.onIceConnectionState = (state) {
    };

    _my_peerConnection.onRemoveStream = (stream) {
      // 
    };

    _letusBegin();

    
  }
  

  _letusBegin() async {
    await createStream('video', false);
  }

  Future createStream(String media, bool userScreen) async {
  // 屏幕共享
  // _localStream = await navigator.mediaDevices.getDisplayMedia({
  //   'audio': true,
  //     'video': {
  //       'mandatory': {
  //         'minWidth':'640', 
  //         'minHeight': '480',
  //         'minFrameRate': '30',
  //       },
  //       'facingMode': 'user',
  //       'optional': [],
  //     }
  // });
  // print(_localStream);
    _localStream = await navigator.mediaDevices.getUserMedia({
    'audio': true,
      'video': {
        'mandatory': {
          'minWidth':'640', 
          'minHeight': '480',
          'minFrameRate': '30',
        },
        'facingMode': 'user',
        'optional': [],
      }
  });
  print(_localStream);
  setState(() {
    _localRenderer.srcObject = _localStream;
  });
  
    //发送本地流
  _localStream.getTracks().forEach((track) => _my_peerConnection.addTrack(track, _localStream));

  _my_peerConnection.addStream(_localStream);

  }

  void switchCamera() {
    if (_localStream != null) {
      _localStream.getVideoTracks()[0].switchCamera();
    }
  }

  void muteMic() {
    if (_localStream != null) {
      bool enabled = _localStream.getAudioTracks()[0].enabled;
      _localStream.getAudioTracks()[0].enabled = !enabled;
    }
  }
  

  initRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
  }

  _handleOffer(Map data) async {
    // print(data);
    try {
      RTCSessionDescription sdp = RTCSessionDescription(data["sdp"], 'offer');
      _my_peerConnection.setRemoteDescription(sdp);

       RTCSessionDescription answerSdp = await _my_peerConnection.createAnswer(offer);
        Map<String,dynamic> sdpDic = {'userId':"flutter",'msgType':0x02,'sdp':answerSdp.sdp};
        channel.emitWithBinary('broadcast',[sdpDic]);
        _my_peerConnection.setLocalDescription(answerSdp);

    } catch (e) {
      print(e.toString());
    }
  }

  _handleAnswer(data) async {
    RTCSessionDescription sdp = RTCSessionDescription(data["sdp"], 'answer');
    _my_peerConnection.setRemoteDescription(sdp);
  }

  _handleIce(data) {
    // this.candidate, this.sdpMid, this.sdpMlineIndex)
    RTCIceCandidate ice = RTCIceCandidate(data["candidate"],data["id"],data["label"]);
    _my_peerConnection.addCandidate(ice);
  }

  void _listenWebSocket() async {
  // 构建请求头，可以放一些cookie等信息，这里加上了origin，因为服务端有origin校验
  Map<String, dynamic> headers = new Map();
  headers['Upgrade'] = 'websocket';
  // 建立websocket链接
  // 链接的书写规范，schame://host:port/namespace, 这里socket_io_client在处理链接时候会把path和后面的query参数都作为namespace来处理，所以如果我们的namespace是/的话，就直接使用http://host/
  channel = IO.io('http://192.168.10.25:8080/socket.io', <String, dynamic>{
    // 构造的header放这里
    'extraHeaders': headers,
    // 说明需要升级成websocket链接
    'transports': ['websocket'],
  });

  // 链接建立成功之后，可以发送数据到socket.io的后端了
  channel.on('connect', (_) {
    var joinRoomParam = json.encode({'userId':"flutter",'roomName':"Room1"});
    channel.emitWithBinary('join-room',[joinRoomParam]);
  });

  channel.on('broadcast', (data){
    var msgType = data["msgType"];
    var userId = data["userId"];

    if (msgType == 0x01) {
      if (userId == "flutter") {return;}
      // print('收到offer');
      _handleOffer(data);
    } else if (msgType == 0x02) {
      // print('收到answer');
      _handleAnswer(data);

    } else if (msgType == 0x03) {
      // print('收到ice');
      if (userId == "flutter") {return;}
      _handleIce(data);
    }
  });



  // 链接建立失败时调用
  channel.on('error', (data){
    print('error');
    print(data);
  });
  // 链接出错时调用
  channel.on("connect_error", (data) {
    print("connect_error");
    print(data);
  });
  // 链接断开时调用
  channel.on('disconnect', (_) => print('disconnect======'));
  // 链接关闭时调用
  channel.on('close', (_) => print('close===='));
  // 服务端emit一个message的事件时，可以直接监听到
  channel.on('message', (data) {
    print('onmessage');
    print(data);
  });
}
  
  _sendOffer(){
    ProcessConnect();
  }

  void ProcessConnect() async {

    //本地SDP描述
    var description_my = await _my_peerConnection.createOffer(offer);
    await _my_peerConnection.setLocalDescription(description_my);
    Map<String, dynamic> sdpDic = {'userId':'flutter','msgType':0x01,'sdp':description_my.sdp};
    channel.emitWithBinary('broadcast',[sdpDic]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
        children: [
          Expanded(child: Container(height: 200,color:Colors.red, child: RTCVideoView(_localRenderer, mirror: true)),flex: 1,),
          Expanded(child: Container(height: 200,color:Colors.yellow,child: RTCVideoView(_remoteRenderer, mirror: true)),flex: 1,)
        ],
      ), GestureDetector(
        onTap: () => {
          _sendOffer()
        },
        child: Container(child: Text('发送offer'), width:100, height: 100, color: Colors.blue,) 
      )
        ]
      )
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return  Scaffold(
  //     appBar:  AppBar(
  //       title:  Text('socket.io'),
  //     ),
  //     body: new Padding(
  //       padding: const EdgeInsets.all(20.0),
  //       child: new Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: <Widget>[
  //           Text('10010')
  //         ],
  //       ),
  //     ),
  //      // This trailing comma makes auto-formatting nicer for build methods.
  //   );
  // }
}

// 简单的socket连接
/*
class ChatPage extends StatefulWidget {
  final String title; 
  final WebSocketChannel channel;

  ChatPage({Key key, @required this.title, @required this.channel})
      : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Form(
              child: new TextFormField(
                controller: _controller,
                decoration: new InputDecoration(labelText: 'Send a message'),
              ),
            ),
            new StreamBuilder(
              stream: widget.channel.stream,
              builder: (context, snapshot) {
                return new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: new Text(snapshot.hasData ? '${snapshot.data}' : ''),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: new Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      
      var ss = json.encode({"eventName":"__join","data":{"room": "100"}});

      widget.channel.sink.add(ss);
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}
*/

/*
class ChatPage extends StatelessWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context, 'Nope.'),
        ), 
        title: Text('聊天',style: TextStyle(color: Colors.black,)),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
          ),
      body: ListView.builder(
      // 水平方向
      itemCount: messages.length,
      itemBuilder: (ctx, index) {
        return ChatItem(model: messages[index]);
      })

      );
  }
}
*/