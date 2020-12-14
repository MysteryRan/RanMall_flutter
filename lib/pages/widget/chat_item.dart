import 'package:RanMall_flutter/model/shopcar_model.dart';
import 'package:RanMall_flutter/pages/image_detail.dart';
import 'package:RanMall_flutter/pages/login_page.dart';
import 'package:RanMall_flutter/pages/video_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ChatItem extends StatefulWidget {
  final ChatMessageModel model;
  ChatItem({Key key, @required this.model}) : super(key: key);

  @override
  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    return _messageContent(widget.model);
  }

  Widget _setHeaderImage(ChatMessageModel model) {
    if (model.messageType == MessageType.receive) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('images/dayCheap_placeholder.png',width: 40, height: 40,),
          SizedBox(width: 20),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              color: Colors.blue
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 100, 
              ),
              child: _mediaContent(model),
            )
          ),
          
        ]
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              color: Colors.orange
            ),
            child: _mediaContent(model),
          ),
          SizedBox(width: 20),
          Image.asset('images/dayCheap_placeholder.png',width: 40, height: 40,),
        ]
      );
    }
  }

  Widget _messageContent(ChatMessageModel model) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: _setHeaderImage(model)
    );
  }

  Widget _mediaContent(ChatMessageModel model) {
    if (model.mediaType == MediaType.text) {
      return ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 100,
              ),
              child: Text('${model.content}'),
            );
    } else if (model.mediaType == MediaType.image) {
        return GestureDetector(
            onTap: () => {
              Navigator.of(context).push(PageRouteBuilder(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (ctx, animal1, animal2) {
            return FadeTransition(opacity: animal1, child: ImageDetailPage());
          }
        ))
        },
        child:  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10), child: AspectRatio(aspectRatio: 1, child: 
        ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 150,
              ),
              child: 
                CachedNetworkImage(
                  imageUrl: "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/100h10000000q7ght9352.jpg",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
            )
      ),),
      );
    } else if (model.mediaType == MediaType.audio) {
      
    } else if (model.mediaType == MediaType.video) {
      // 视频封面
      return GestureDetector(
        onTap: () => {
          Navigator.of(context).push(PageRouteBuilder(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (ctx, animal1, animal2) {
            return FadeTransition(opacity: animal1, child: VideoDetailPage());
          }
        ))
        },
        child: Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10), child: 
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              AspectRatio(aspectRatio: 1, child: 
        ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 150,
              ),
              child: 
                CachedNetworkImage(
                  imageUrl: "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/100h10000000q7ght9352.jpg",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
            )
        ),
        Container(
          color: Colors.red,
          child: Icon(Icons.star),
        )
        
            ]
          )
      
      )
      );
    } 
    return Text('10010');
  }
}