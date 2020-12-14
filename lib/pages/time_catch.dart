import 'package:flutter/material.dart';

class TimeCatch extends StatefulWidget {
  TimeCatch({Key key}) : super(key: key);

  @override
  _TimeCatchState createState() => _TimeCatchState();
}

class _TimeCatchState extends State<TimeCatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
	title:Text("AppBarButton"),
	centerTitle:true,//标题居中显示
	leading:IconButton(//如果有自定义按钮当前页面的默认返回按钮就被覆盖
		icon:Icon(Icons.menu),
		onPressed:(){
			print("点击AppBarButton图标");
		}
	),
	actions:<Widget>[
		IconButton(
			icon:Icon(Icons.search),
			onPressed:(){
				print("点击search图标");
			}
		),	
		IconButton(
			icon:Icon(Icons.settings),
			onPressed:(){
				print("点击settings图标");
			}
		),	
	]
),
      body: Text('ddd')

      );
  }
}