import 'package:flutter/material.dart';
import 'dart:async';

class Register extends StatefulWidget{
  @override
  _RegisterState createState()=> _RegisterState();
}
class _RegisterState extends State<Register> {
  TextEditingController _mobile = TextEditingController();
  TextEditingController _veriCode = TextEditingController();
  FocusNode _mobileFocus = FocusNode();
  FocusNode _veriFocus = FocusNode();
  ScrollController _scrollController = ScrollController();

  Timer _timer;
  int _start = 60;
  void countdown(){
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec, (Timer timer) => setState(() {
          if (_start < 1) {
            timer.cancel();//定时器清除
            _start = 60;
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }
  /*
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar:AppBar( title: Text("登录"), ),
        body: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.67,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: 
                      Container(color: Colors.red,width: MediaQuery.of(context).size.width,height: 100,),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 160,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("+86", style: TextStyle(
                                  fontSize: 28.0
                              ),),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 30.0,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            focusNode: _mobileFocus,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              hintText: '请输入手机号',
                              border: InputBorder.none,
                            ),
                            controller: _mobile,
                          ),
                        )
                      ],
                    )
                ),
                Container(
                    margin: EdgeInsets.only(top: 20.0 ),
                    width:MediaQuery.of(context).size.width,
                    height:90,
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                          ),
                          width: 100,
                          height: 90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 160,
                                child: Center(
                                  child: Text("验证码", style: TextStyle(
                                    fontSize: 28.0,
                                  )),
                                ),
                              ),
                              Expanded(
                                child:  TextFormField(
                                  focusNode: _veriFocus,
                                  controller: _veriCode,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: "请输入验证码",
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Builder(builder:(BuildContext context){
                                  return FlatButton(
                                      onPressed: (){
                                        _mobileFocus.unfocus();
                                        if(_start != 60){ //简单判断是否可以触发获取验证
                                          return null;
                                        }
                                        var result = Validator.checkMobile(this._mobile.text); //验证手机号
                                        if(result == true){
                                          print("验证通过");
                                          countdown();
                                        }else{
                                          Scaffold.of(context).hideCurrentSnackBar();
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  duration : Duration(seconds: 1),
                                                  backgroundColor: Colors.orangeAccent,
                                                  content: new Text(result)
                                              )
                                          );
                                        }
                                      },
                                      color: _start==60 ? Colors.blue : Colors.grey,
                                      textColor: _start==60 ? Colors.white : Colors.black54,
                                      child:Container(
                                        height:80,
                                        child: Center(
                                          child:  Text(
                                              _start == 60 ? "获取验证码" : "${_start} S"
                                          ),
                                        ),
                                      )
                                  );
                                })
                            )
                        )
                      ],
                    )
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    top:  20,
                    bottom: 80,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "请输入您的手机号码，注册您的账号",
                      style:TextStyle(
                          fontSize: 28.0
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20.0),
                    width: 710,
                    height: 90,
                    child:Builder(builder: (context){
                      return FlatButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () async {
                          _veriFocus.unfocus();
                          _mobileFocus.unfocus();
                          Scaffold.of(context).hideCurrentSnackBar();
                          Scaffold.of(context).showSnackBar(
                              SnackBar(
                                  duration : Duration(seconds: 1),
                                  backgroundColor: Colors.green,
                                  content: new Text("注册成功")
                              )
                          );
                        },
                        child:  Container(
                          width:710,
                          height: 90,
                          child: Center(
                            child:Text(
                              "注册",
                              style: TextStyle(
                                  fontSize: 28.0
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                ),
              ],
            )
        ),
        resizeToAvoidBottomPadding:false
    );
  }
  */
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
          title: Text('注册',style: TextStyle(fontSize: 18.0,color: Colors.black),),
        ),
        body: GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      FocusScope.of(context).requestFocus(FocusNode());
    },
    child: ListView(
      controller: _scrollController,
        children: [
        Container(
      child:buildForm()
    ),]
    )
    ));
  }

  // TextEditingController unameController = TextEditingController();
  // TextEditingController pwdController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();


  Widget buildForm() {
    return Form(
      //设置globalKey，用于后面获取FormState
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(
    bottom: 10
  ),
  child: TextFormField(
              autofocus: false,
              keyboardType: TextInputType.number,
              //键盘回车键的样式
              textInputAction: TextInputAction.next,
              controller: _mobile,
              decoration: InputDecoration(
                  labelText: "手机号",
                  hintText: "手机号",
                  icon: Icon(Icons.person)),
              // 校验用户名
              // validator: (v) {
              //   return v.trim().length > 0 ? null : "用户名不能为空";
              // }
              ),),
              Padding(padding: EdgeInsets.only(
    bottom: 10
  ),
  child: Row(
    children: [
      Container(
    width: MediaQuery.of(context).size.width - 120,
    child: TextFormField(
              autofocus: false,
              controller: _veriCode,
              decoration: InputDecoration(
                  labelText: "验证码", hintText: "验证码", icon: Icon(Icons.lock)),
              obscureText: true,
              ),
  ),
  Builder(builder:(BuildContext context){
                                  return FlatButton(
                                    minWidth: 80,
                                      onPressed: (){
                                        _mobileFocus.unfocus();
                                        if(_start != 60){ //简单判断是否可以触发获取验证
                                          return null;
                                        }
                                        var result = Validator.checkMobile(this._mobile.text); //验证手机号
                                        if(result == true){
                                          print("验证通过");
                                          countdown();
                                        }else{
                                          Scaffold.of(context).hideCurrentSnackBar();
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  duration : Duration(seconds: 1),
                                                  backgroundColor: Colors.orangeAccent,
                                                  content: new Text(result)
                                              )
                                          );
                                        }
                                      },
                                      color: _start==60 ? Colors.blue : Colors.grey,
                                      textColor: _start==60 ? Colors.white : Colors.black54,
                                      child:Container(
                                        width: 80,
                                        child: Center(
                                          child:  Text(
                                              _start == 60 ? "获取验证码" : "${_start} S"
                                          ),
                                        ),
                                      )
                                  );
                                })
    ],
  ),
  
  
      
      

    
  ),
  
  
              
          // 登录按钮
          Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom), child:Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    child: Text("注册"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      if ((formKey.currentState as FormState).validate()) {
                        print(_veriCode.text);
                        print(_veriCode.text);
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

  @override
  void dispose() { //定时器清除
    _timer?.cancel();
    super.dispose();
  }
}

class Validator {
  static checkMobile(value){
    if(value.isEmpty){
      return "请输入手机号";
    }
    RegExp reg = new RegExp(r'^\d{11}$');
    if (!reg.hasMatch(value)) {
      return "请输入11位手机号码";
    }
    return true;
  }
}