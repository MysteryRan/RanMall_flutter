import 'package:RanMall_flutter/model/shopcar_model.dart';
import 'package:RanMall_flutter/model/user_info_model.dart';
import 'package:flutter/material.dart'; //ChangeNotifier需要material素材库

class UserInfo extends ChangeNotifier{
  // UserModel _info;
  // UserModel get info => _info ?? UserModel();
  // void setInfo(info){
  //   _info = UserModel.fromJson(info);
  //   notifyListeners();
  // }

  // HomeRequest.requestGoods().then((value) {
  //     setState(() {
  //       goods.addAll(value);
  //     });
  //   });

  List<dynamic> tempShopcars = [
    ShopCarModel(checked:false, count: 1,shopCarID: '1'),
    ShopCarModel(checked:false, count: 2,shopCarID: '2'),
    ShopCarModel(checked:false, count: 3,shopCarID: '3'),
    ShopCarModel(checked:false, count: 4,shopCarID: '4'),
  ];

  UserModel user = UserModel(name: "kong");
  void setInfo(info){
    print(info);
    user = UserModel.fromJson(info);
    print(user.name);
    notifyListeners();
  }

  void finishPay(List info){
    print(info);
    for (var value in info) {
      tempShopcars.remove(value);
    } 
    notifyListeners();
  }
}