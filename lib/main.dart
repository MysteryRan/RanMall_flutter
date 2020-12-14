import 'package:RanMall_flutter/pages/pay_page.dart';
import 'package:RanMall_flutter/pages/shop_car.dart';
import 'package:RanMall_flutter/tool/user_tool.dart';
import 'package:flutter/material.dart';
import 'package:RanMall_flutter/navigator/initialize_items.dart';
import 'package:provider/provider.dart';


// void main() {
//   runApp(MyApp());
// }

void main() => runApp(
    ChangeNotifierProvider(
      create: (_) => UserInfo(),
      child: MyApp(),
    )
);

// void main() => runApp(
//     MultiProvider(
//       providers: [
//         Provider(create: (_) => UserInfo()),
//         Provider(create: (_) => ShopCarInfo()),
//       ],
//       child: MyApp(),
//     )
// );

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
      routes: <String,WidgetBuilder>{
        "/home":(BuildContext context)=> HYMainPage(),
        "/shopCar":(BuildContext context)=> ShopCar(),
        "/pay":(BuildContext context)=> PayPage(),
      },

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

