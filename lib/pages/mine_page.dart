import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录,注册"),
      ),
      body:
      //  Column(
      //    children: [
      //      ListView(
      //     scrollDirection: Axis.horizontal,
      //     children:[
            Text('1111'),
      //       Container(width: (MediaQuery.of(context).size.width),height: 100,),
      //       Text('2222'),
      //     ]
      //   )
      //   ]
      // ),
    );
  }
}