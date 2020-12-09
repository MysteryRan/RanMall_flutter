import 'package:RanMall_flutter/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MinePage>
    with SingleTickerProviderStateMixin {
  
  //  初始化滑动器
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.orange),
      child: Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          centerTitle: true,
          title: Text('首页',style: TextStyle(fontSize: 24.0,color: Colors.white),),
        ),
        body: GestureDetector(
          onTap: () => {
            Navigator.of(context).push(
              CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => LoginHomePage(),
              ),)
          },
          child: Text('1111'),  
        ),
      )
    );
  }
}