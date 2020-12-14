import 'package:RanMall_flutter/tool/user_tool.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PayPage extends StatefulWidget {

  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {

  //  初始化滑动器
  @override
  void initState() {
    super.initState();

    Provider.of<UserInfo>(context, listen: false)
      .setInfo({"name":"user_name"}
    );
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
          onPressed: () => Navigator.pop(context, 'Nope.'),
        ), 
        title: Text('支付',style: TextStyle(color: Colors.black,)),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
          ),
      body: Text('ddd')

      );
  }
}


