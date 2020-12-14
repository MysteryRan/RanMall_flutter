import 'package:RanMall_flutter/model/shopcar_model.dart';
import 'package:RanMall_flutter/pages/widget/chat_item.dart';
import 'package:flutter/material.dart';

final List<ChatMessageModel> messages  = [
  ChatMessageModel(messageType: MessageType.receive, mediaType: MediaType.text, content: '师德师风的粉红色的覅和速度发贺岁档符合度封ID水电费苏打粉hi速度法华寺U盾还是闪电发货四U盾付伙食费'),
  ChatMessageModel(messageType: MessageType.send, mediaType: MediaType.text, content: 'sddsdssdds'),
  ChatMessageModel(messageType: MessageType.receive, mediaType: MediaType.image, content: 'sddsdssdds'),
  ChatMessageModel(messageType: MessageType.send, mediaType: MediaType.text, content: '师德师风的粉红色的覅和速度发贺岁档符合度封ID水电费苏打粉hi速度法华寺U盾还是闪电发货四U盾付伙食费师德师风的粉红色的覅和速度发贺岁档符合度封ID水电费苏打粉hi速度法华寺U盾还是闪电发货四U盾付伙食费师德师风的粉红色的覅和速度发贺岁档符合度封ID水电费苏打粉hi速度法华寺U盾还是闪电发货四U盾付伙食费'),
  ChatMessageModel(messageType: MessageType.receive, mediaType: MediaType.text, content: 'sddsdssdds'),
  ChatMessageModel(messageType: MessageType.receive, mediaType: MediaType.video, content: 'sddsdssdds'),
];

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