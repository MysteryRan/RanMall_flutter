import 'dart:ffi';

import 'package:flutter/material.dart';

final List stars  = [
  "1","1","1","1","2"
];

class EvalueItem extends StatefulWidget {
  EvalueItem({Key key}) : super(key: key);

  @override
  _EvalueItemState createState() => _EvalueItemState();
}

class _EvalueItemState extends State<EvalueItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10,top: 10),
       color: Colors.white,
       child: Column(
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(children: [
                 ClipOval(
                    child: Image.asset('images/dayCheap_placeholder.png', width: 28, height: 28,fit: BoxFit.cover),
                      ),
                 SizedBox(width: 2),
                 Text('sk***e')
               ],),
               _starSet()
             ],
           ),
           SizedBox(height: 2),
           Text('手感很好，杯子材质很舒服有点磨砂的感觉。就是接热水稍稍有点烫手，总体满意。'),
           SizedBox(height: 2),
           _evaluImagesSet(),
           Row(
             children: [
               Text('规格',style: TextStyle(color: Color.fromRGBO(155, 155, 155, 1),fontSize: 11),),
               SizedBox(width: 2),
               Text('草绿色',style: TextStyle(color: Color.fromRGBO(155, 155, 155, 1),fontSize: 11),),
               SizedBox(width: 2),
               Text("1000ml",style: TextStyle(color: Color.fromRGBO(155, 155, 155, 1),fontSize: 11),),
             ],
           )
         ]
       ),
    );
  }

  Widget _starSet() {
    return Wrap(
        spacing: 2,
        runSpacing: 2,
        children: [
          for ( var i in stars ) Container(
            child: i == "1" ? Image.asset('images/star.png',width: 10,height: 10,) : Image.asset('images/start_gray.png',width: 10,height: 10,)
          ),
        ]
      );
  }

    Widget _evaluImagesSet() {
    return Wrap(
        spacing: 5.5,
        runSpacing: 5.5,
        children: [
          for ( var i in stars ) Container(
            child: Image.asset('images/dayCheap_placeholder.png',width: (MediaQuery.of(context).size.width - 55) / 4.0 )
          ),
        ]
      );
  }
}