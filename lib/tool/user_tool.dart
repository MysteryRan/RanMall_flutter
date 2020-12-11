import 'package:RanMall_flutter/model/user_info_model.dart';
import 'package:flutter/material.dart'; //ChangeNotifier需要material素材库

class UserInfo extends ChangeNotifier{
  // UserModel _info;
  // UserModel get info => _info ?? UserModel();
  // void setInfo(info){
  //   _info = UserModel.fromJson(info);
  //   notifyListeners();
  // }

  UserModel user = UserModel(name: "kong");
  void setInfo(info){
    print(info);
    user = UserModel.fromJson(info);
    print(user.name);
    notifyListeners();
  }
}