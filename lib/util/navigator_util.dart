import 'package:flutter/material.dart';

class NavigatorUtil {
  static push(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(
        builder: (ctx) {
          return page;
        }
    ));
  }
}