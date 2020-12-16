import 'package:RanMall_flutter/model/shopcar_model.dart';
import 'package:RanMall_flutter/service/data_base_helper.dart';
import 'package:flutter/material.dart';

class AddAddressPage extends StatefulWidget {
  AddAddressPage({Key key}) : super(key: key);

  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  // 数据库
  DatabaseHelper helper = DatabaseHelper();

  // textfield
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();

  // model
  AddressModel _model;

  Future <void> _customShowMyDialog(BuildContext context, String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _saveAddressClick(BuildContext context) {
    print("addListener() -- ${_phoneController.text}");
    if (_nameController.text.length < 1) {
      _customShowMyDialog(context, '请输入用户名');
      return;
    }
    if (_phoneController.text.length < 1) {
      _customShowMyDialog(context, '请输入手机号');
      return;
    }
    if (_addressController.text.length < 1) {
      _customShowMyDialog(context, '请输入地址');
      return;
    }
    if (_detailController.text.length < 1) {
      _customShowMyDialog(context, '请输入详细地址');
      return;
    }

    RegExp exp = RegExp(
          r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    bool matched = exp.hasMatch(_phoneController.text);
    if (!matched) {
      _customShowMyDialog(context, '请输入正确手机号');
      return;
    }

    _model = AddressModel(name: _nameController.text,phone: _phoneController.text,address: _addressController.text,
    detail: _detailController.text);

    helper.insertNote(_model);

    Navigator.pop(context, _model);

  }

  @override
  void initState() { 
    super.initState();
    
    // 添加监听
    // _nameController.addListener((){
      
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context, 'Nope.'),
        ), 
        title: Text('新增收货地址',style: TextStyle(color: Colors.black,)),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
          ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0), child: 
            Row(
              children: [
                Text('收货人'),
                SizedBox(width: 30),
                Container(
                  width: 200,
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "收货人",
                        hintStyle: TextStyle(fontSize: 12)
                    ),
                  ),
                ),
              ],
            ),),
            Divider(height: 1.0, color: Colors.blue,),
            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0), child: 
            Row(
              children: [
                Text('手机号码'),
                SizedBox(width: 30),
                Container(
                  width: 200,
                  child: TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "手机号码",
                        hintStyle: TextStyle(fontSize: 12)
                    ),
                  ),
                ),
              ],
            ),),
            Divider(height: 1.0, color: Colors.blue,),
            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0), child: 
            Row(
              children: [
                Text('所在地区'),
                SizedBox(width: 30),
                Container(
                  width: 200,
                  child: TextField(
                    controller: _addressController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "所在地区",
                        hintStyle: TextStyle(fontSize: 12)
                    ),
                  ),
                ),
              ],
            ),),
            Divider(height: 1.0, color: Colors.blue,),
            Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0), child: 
            Row(
              children: [
                Text('详细地址'),
                SizedBox(width: 30),
                Container(
                  width: 200,
                  child: TextField(
                    controller: _detailController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "详细地址",
                        hintStyle: TextStyle(fontSize: 12)
                    ),
                  ),
                ),
              ],
            ),),
            Divider(height: 1.0, color: Colors.blue,),
            GestureDetector(
              onTap: () => {
                _saveAddressClick(context)
              },
              child:Container(
                margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 53, 111, 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                child: Text('保存',style: TextStyle(color: Colors.white),)
              )
            )
            
          ],
        ),
      ),
      
      
      );
  }
}