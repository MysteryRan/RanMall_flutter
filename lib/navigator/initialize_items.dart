import 'package:RanMall_flutter/pages/home_page.dart';
import 'package:RanMall_flutter/pages/mine_page.dart';
import 'package:RanMall_flutter/pages/shop_car.dart';
import 'package:flutter/material.dart';



const _defaultColor = Colors.red;
const _activeColor = Colors.black;

List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
      label: "首页",
      icon: Icon(Icons.home,color: _defaultColor,),
      activeIcon: Icon(Icons.home, color: _activeColor),
  ),
  BottomNavigationBarItem(
      label: "购物车",
      icon: Icon(Icons.star)
  ),
  BottomNavigationBarItem(
      label: "我的",
      icon: Icon(Icons.star)
  ),
];

List<Widget> pages = [
  RanHomePage(),
  shopCar(),
  MinePage(),
];