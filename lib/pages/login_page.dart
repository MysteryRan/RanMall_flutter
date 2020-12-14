import 'package:RanMall_flutter/pages/product_detail.dart';
import 'package:RanMall_flutter/pages/regist.dart';
import 'package:RanMall_flutter/tool/user_default.dart';
import 'package:RanMall_flutter/tool/user_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LoginHomePage extends StatefulWidget {
  @override
  _LoginHomePageState createState() => _LoginHomePageState();
  
}

class _LoginHomePageState extends State<LoginHomePage> with WidgetsBindingObserver {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.collections_bookmark, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ), 
          elevation: 1.0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text('登录',style: TextStyle(fontSize: 18.0,color: Colors.black),),
        ),
        body: GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      FocusScope.of(context).requestFocus(FocusNode());
    },
    child: ListView(
      controller: _scrollController,
        reverse: true,
        children: [
        Container(
      padding: EdgeInsets.only(top: 450),
      child:buildForm()
    ),]
    )
    
    
    
    ));
  }

  TextEditingController unameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();


  Widget buildForm() {
    return Form(
      //设置globalKey，用于后面获取FormState
      key: formKey,
      child: Column(
        children: <Widget>[
          Text('键盘遮挡问题'),
          GestureDetector(
            onTap: ()=> {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) {
                  return Register();
                }
              ))
            },
            child: Text('注册'),
          ),
          Padding(padding: EdgeInsets.only(
    bottom: 10
  ),
  child: TextFormField(
              autofocus: false,
              keyboardType: TextInputType.number,
              //键盘回车键的样式
              textInputAction: TextInputAction.next,
              controller: unameController,
              decoration: InputDecoration(
                  labelText: "用户名或邮箱",
                  hintText: "用户名或邮箱",
                  icon: Icon(Icons.person)),
              // 校验用户名
              validator: (v) {
                return v.trim().length > 0 ? null : "用户名不能为空";
              }),),
              Padding(padding: EdgeInsets.only(
    bottom: 10
  ),
  child:TextFormField(
              autofocus: false,
              controller: pwdController,
              decoration: InputDecoration(
                  labelText: "密码", hintText: "您的登录密码", icon: Icon(Icons.lock)),
              obscureText: true,
              //校验密码
              validator: (v) {
                return v.trim().length > 5 ? null : "密码不能少于6位";
              }),),
          // 登录按钮
          Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom), child:Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    child: Text("登录"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      //在这里不能通过此方式获取FormState，context不对
                      //print(Form.of(context));
                      // 通过_formKey.currentState 获取FormState后，
                      // 调用validate()方法校验用户名密码是否合法，校验
                      // 通过后再提交数据。
                      if ((formKey.currentState as FormState).validate()) {
                        //验证通过提交数据
                        print(unameController.text);
                        print(pwdController.text);

                        var userSet = UserDefault();
                        userSet.setStorage('name', 'user_name');
                        Provider.of<UserInfo>(context, listen: false)
                          .setInfo({"name":"user_name"}
                        );
                        
                      }
                    },
                  ),
                ),
              ],
            ),),
          
        ],
      ),
    );
  }

}