import 'package:flutter/material.dart';

class EveryCheapItem extends StatefulWidget {
  EveryCheapItem({Key key}) : super(key: key);

  @override
  _EveryCheapItemState createState() => _EveryCheapItemState();
}

class _EveryCheapItemState extends State<EveryCheapItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left:10,right: 10, bottom: 10), child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      child: Row(
        children: [
          Padding(padding: EdgeInsets.all(10), child: AspectRatio(aspectRatio: 1, child:
            Image.asset('images/dayCheap_placeholder.png'),
          )),
          Expanded(child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 10), child: 
                      Text('Rawpockets脖子深蓝色恩格斯历险含糊其词磷化圆领T恤', maxLines: 2)
                    ),
                    SizedBox(height: 9),
                    Container(
                      alignment: Alignment.center,
                      child: Text('已抢完', style: TextStyle(color: Colors.white, fontSize: 12),),
                      width: 140,
                      height: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        gradient: LinearGradient(
                      colors: [Color.fromRGBO(255, 53, 111, 1), Color.fromRGBO(255, 99, 53, 1)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
              )),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10), child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('￥5499',style: TextStyle(color: Color.fromRGBO(255, 82, 82, 1), fontSize: 21, fontWeight: FontWeight.bold),),
                      Text('￥4299',style: TextStyle(decoration: TextDecoration.lineThrough, decorationColor: Color.fromRGBO(0, 0, 0, 0.8))),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(right: 10), child: 
                        Container(
                          padding: EdgeInsets.only(left: 13, right: 13,top: 5, bottom: 5),
                          child: Text('去查看',style: TextStyle(color: Colors.white),),
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        gradient: LinearGradient(
                      colors: [Color.fromRGBO(255, 125, 41, 1), Color.fromRGBO(252, 19, 7, 1)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
              ))
                        )
                      ),
                    ]
                  )
                ),
                
              ],
          )
          ),
        ],
      ),
    )
  );
    
  }
}