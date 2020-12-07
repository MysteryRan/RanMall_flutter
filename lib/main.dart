import 'package:flutter/material.dart';
import 'package:RanMall_flutter/navigator/bottom_bar_item.dart';
import 'package:RanMall_flutter/navigator/initialize_items.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent // 没有高亮颜色
      ),
      home: HYMainPage(),
    );
  }
}

class HYMainPage extends StatefulWidget {
  @override
  _HYMainPageState createState() => _HYMainPageState();
}

class _HYMainPageState extends State<HYMainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: IndexedStack( // 重叠到一起
      index: _currentIndex,
      children: pages,
    ),
    bottomNavigationBar: BottomNavigationBar(
      selectedFontSize: 14,
      unselectedFontSize: 14,
      fixedColor: Colors.black,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      items: items, // 从item文件中导入进来的
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    ),
  );    
  }
}

