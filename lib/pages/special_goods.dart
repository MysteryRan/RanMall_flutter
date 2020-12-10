import 'package:flutter/material.dart';

class SpecialGoodsPage extends StatefulWidget {
  @override
  _SpecialGoodsPageState createState() => _SpecialGoodsPageState();
}

class _SpecialGoodsPageState extends State<SpecialGoodsPage> {

  //  初始化滑动器
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ), 
          elevation: 1.0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text('天天双十一',style: TextStyle(fontSize: 18.0,color: Colors.black),),
        ),
        body: Stack(
          alignment:Alignment.topCenter,
          children: [
            ListView(
              children: [
                Container(
                  height: 300,
                  color: Colors.red
                ),
                Container(
                  height: 300,
                  color: Colors.green
                ),
                Container(
                  height: 300,
                  color: Colors.blue
                ),
                Container(
                  height: 300,
                  color: Colors.red
                ),
                Container(
                  height: 300,
                  color: Colors.green
                ),
              ]
            ),
            Container(
                  height: 300,
                  color: Colors.yellow
                ),
            
          ]
        )
    );
  }
}



