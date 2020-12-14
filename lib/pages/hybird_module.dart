import 'package:RanMall_flutter/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HybirdPage extends StatefulWidget {
  @override
  _HybirdPageState createState() => _HybirdPageState();
}

class _HybirdPageState extends State<HybirdPage> {
  String recive="暂无";
  static const messageChannel = const BasicMessageChannel('basic_channel_page', StandardMessageCodec());

  //发送消息
  Future<Map> sendMessage(Map json) async {
    Map reply = await messageChannel.send(json);
    //解析 原生发给 Flutter 的参数
    String message = reply["content"];
    setState(() {
      recive="$message";
    });
    return reply;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
  }

  @override
  void dispose() {
    super.dispose();
  }

  //接收消息监听
  void receiveMessage() {
    messageChannel.setMessageHandler((result) async {
      print("---result----------$result--------");

      //解析 原生发给 Flutter 的参数
      // int code = result["code"];
      // String message=result["message"];
      setState(() {
        // recive="receiveMessage: code:$code message:$message";
        recive = result;
      });
      return 'Flutter 已收到消息';
    });
  }

  static const methodChannel = const MethodChannel('method_channel_page');

  static Future<dynamic> invokNative(String method, {Map arguments}) async {
    print("---------invokeMethod----------");
    if (arguments == null) {
      return await methodChannel.invokeMethod(method);
    } else {
      return await methodChannel.invokeMethod(method, arguments);
    }
  }

  Future<dynamic> nativeMessageListener() async {
    // ignore: missing_return
    methodChannel.setMethodCallHandler((resultCall) {
      MethodCall call = resultCall;
      String method = call.method;
      Map arguments = call.arguments;

      int code = arguments["code"];
      String message = arguments["content"];

      print("---resultCall---------$resultCall---------------");
//      print("---method---------$method---------------");
//      print("---arguments---------$arguments---------------");
//      print("---code---------$code---------------");
//      print("---message---------$message---------------");

      setState(() {
        recive = " code $code message $message method $method ";
      });
    });
  }

  //EventChannel（ 用于数据流（event streams）的通信）
  static const EventChannel _eventChannel = const EventChannel('event_channel_page');

  Future<dynamic> eventNativeMessageListener() async {
    _eventChannel.receiveBroadcastStream().listen((arguments) {
      int code = arguments["code"];
      String message = arguments["content"];
      print("----arguments--------------$arguments--------");
//      print("----code--------------$code--------");
//      print("----message--------------$message--------");
      setState(() {
        recive = "message $message";
      });
    }, onError: (event) {});
  }


  @override
  void initState() {
    super.initState();

    receiveMessage();
    nativeMessageListener();
    eventNativeMessageListener();

    print('rrrrrr');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          centerTitle: true,
          title: Text('Hybird',style: TextStyle(fontSize: 24.0,color: Colors.black),),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            GestureDetector(
              onTap: () {
                sendMessage({"code":110,"method":"basicchannel1","result":"this is flutter basicchannel1",});
              },
              child: Column(
                children: [
                  Text("$recive"),
                  Container(
                    height: 100,
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: Text('BasicChannel'),
                  ),
                ]
              )
            ),
            GestureDetector(
              onTap: () {
                // invokNative("methodchannel1").then((value) {
                //   String message = value["content"];
                //   setState(() {
                //     recive = "$message";
                //   });
                // });
                // 不带参数
                invokNative("methodchannel2");
                // 带参数
                // Map map = {"a":"A","b":"B"};
                // invokNative("methodchannel3", arguments:map);
              },
              child: Column(
                children: [
                  Text("$recive"),
                  Container(
                    height: 100,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Text('MethodChannel'),
                  ),
                ]
              )
            ),
            GestureDetector(
              onTap: () {
                
              },
              child: Column(
                children: [
                  Text("$recive"),
                  Container(
                    height: 100,
                    color: Colors.yellow,
                    alignment: Alignment.center,
                    child: Text('EventChannel'),
                  ),
                ]
              )
            ),
            GestureDetector(
              onTap: () {
                // 返回时 传值
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) {
                      return ChatPage();
                    }
                ));
              },
              child: Column(
                children: [
                  Text("$recive"),
                  Container(
                    height: 100,
                    color: Colors.yellow,
                    alignment: Alignment.center,
                    child: Text('聊天界面'),
                  ),
                ]
              )
            )
          ]
        )
      );
  }
}