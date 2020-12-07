import 'package:flutter/material.dart';

class OneBottomBarItem extends BottomNavigationBarItem {
  OneBottomBarItem(String iconName, String title)
      : super(
    label: title,
    // icon: Image.asset("assets/images/tabbar/$iconName.png", width: 32, gaplessPlayback: true,),
    icon: Icon(IconData(0xe91d, fontFamily: 'MaterialIcons'), size: 30, color: Colors.orange,),
    activeIcon: Icon(IconData(0xe91d, fontFamily: 'MaterialIcons'), size: 30, color: Colors.blue,),
  );
}