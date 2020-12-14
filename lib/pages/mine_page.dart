import 'package:RanMall_flutter/model/home_model.dart';
import 'package:RanMall_flutter/pages/login_page.dart';
import 'package:RanMall_flutter/service/home_request.dart';
import 'package:RanMall_flutter/tool/user_tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'widget/home_goods.dart';

class MinePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MinePage>
    with SingleTickerProviderStateMixin {

  List<HomeGoodsModel> goods = [];
  
  //  初始化滑动器
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    HomeRequest.requestGoods().then((value) {
      setState(() {
        goods.addAll(value);
      });
    });

    // Consumer<UserInfo>(
    //   builder: (context, value, child) {
    //     print('value.info.name');
    //     print(value.user.name);
        
    //   },
    // );

      var today = DateTime.now();
      print('当前时间是：$today');
      var date1 = today.millisecondsSinceEpoch;
      print('当前时间戳：$date1');
      var date2 = DateTime.fromMillisecondsSinceEpoch(date1);
      print('时间戳转日期：$date2');
      //拼接成date
      var dentistAppointment = new DateTime(2019, 6, 20, 17, 30,20);
      print(dentistAppointment);
      // 字符串转date
      DateTime date3 = DateTime.parse("2019-06-20 15:32:41");
      print(date3);
      // 时间比较
      print(today.isBefore(date3));// 在之前
      print(today.isAfter(date3)); // 在之后
      print(date3.isAtSameMomentAs(date3));// 相同

      print(date3.compareTo(today));// 大于返回1；等于返回0；小于返回-1。
      // print(DateTime.now().toString());
      // print(DateTime.now().toIso8601String());

      //时间增加
      var fiftyDaysFromNow = today.add(new Duration(days: 5));
      print('today加5天：$fiftyDaysFromNow');
      //时间减少
      DateTime fiftyDaysAgo = today.subtract(new Duration(days: 5));

      
      print('today减5天：$fiftyDaysAgo');
      //时间差 两个时间相差 小时数
      print('比较两个时间 差 小时数：${fiftyDaysFromNow.difference(fiftyDaysAgo)}');

      print('本地时区简码：${today.timeZoneName}');

      print('返回UTC与本地时差 小时数：${today.timeZoneOffset}');

      print('获取年月日：${today.year}');//month、day、hour、minute、second、millisecond、microsecond

      print('星期：${today.weekday}');// 返回星期几

      print(DateFormat("yyyy-MM-dd").format(DateTime.now()));


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget _bottomVip() {
    return Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Image.asset('images/vip_content_bg.png'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('十八省',style: TextStyle(color: Color.fromRGBO(240, 218, 145, 1)),),
            Text('查看特权',style: TextStyle(color: Color.fromRGBO(240, 218, 145, 1)),),
          ],
        )
      ],
    ));
  }

  Widget _middleItems(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.fromLTRB(10, 8, 10, 0), 
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10), child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('我的订单'),
                  Text('查看全部订单'),
                ],
              ),
              ),
              Divider(height: 0.5,indent: 0.0,color: Color.fromRGBO(230, 230, 230, 1),),
              Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      // Image(),
                      Icon(Icons.ac_unit),
                      Text('待付款')
                    ],
                  ),
                  Column(
                    children: [
                      // Image(),
                      // IconButton(iconSize: 24,icon: Icon(Icons.ac_unit), onPressed: null),
                      Icon(Icons.ac_unit),
                      Text('待收货')
                    ],
                  ),
                  Column(
                    children: [
                      // Image(),
                      Icon(Icons.ac_unit),
                      Text('待评价')
                    ],
                  ),
                  Column(
                    children: [
                      // Image(),
                      Icon(Icons.ac_unit),
                      Text('退款/售后')
                    ],
                  )
                ]
              )),
            ],
          ),
        )
      ),
      Padding(padding: EdgeInsets.fromLTRB(10, 8, 10, 0),child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
          ),
                    child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10), child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('我的钱包'),
                  Text(''),
                ],
              ),
              ),
              Divider(height: 0.5,indent: 0.0,color: Color.fromRGBO(230, 230, 230, 1),),
              Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      // Image(),
                      // Icon(Icons.ac_unit),
                      Text('1446.00'),
                      SizedBox(height: 7),
                      Text('余额')
                    ],
                  ),
                  Column(
                    children: [
                      // Image(),
                      // IconButton(iconSize: 24,icon: Icon(Icons.ac_unit), onPressed: null),
                      // Icon(Icons.ac_unit),
                      Text('1446.00'),
                      SizedBox(height: 7),
                      Text('优惠券')
                    ],
                  ),
                  Column(
                    children: [
                      // Image(),
                      // Icon(Icons.ac_unit),
                      Text('1556.00'),
                      SizedBox(height: 7),
                      Text('礼品券')
                    ],
                  ),
                ]
              )),
            ],
          ),
        )
      ),
        Padding(padding:  EdgeInsets.fromLTRB(10, 8, 10, 0),child:Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
          ),
                    child: Column(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      // Image(),
                      Icon(Icons.ac_unit),
                      SizedBox(height: 5),
                      Text('电话咨询')
                    ],
                  ),
                  Column(
                    children: [
                      // Image(),
                      // IconButton(iconSize: 24,icon: Icon(Icons.ac_unit), onPressed: null),
                      Icon(Icons.ac_unit),
                      SizedBox(height: 5),
                      Text('在线咨询')
                    ],
                  ),
                  Column(
                    children: [
                      // Image(),
                      Icon(Icons.ac_unit),
                      SizedBox(height: 5),
                      Text('地址管理')
                    ],
                  ),
                ]
              )),
            ],
          ),
        )
      ),
      ],
    );
  }

  Widget _middleFuncs() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 50,
      runSpacing: 0,
      children: [
        Column(
          children: [
            Text('1',style: TextStyle(color: Colors.white),),
            SizedBox(height: 3),
            Text('所获购物券',style: TextStyle(color: Colors.white),)
          ],
        ),
        Column(
          children: [
            Text('99',style: TextStyle(color: Colors.white),),
            SizedBox(height: 3),
            Text('我的收藏',style: TextStyle(color: Colors.white),)
          ],
        ),
        Column(
          children: [
            Text('99',style: TextStyle(color: Colors.white),),
            SizedBox(height: 3),
            Text('我的足迹',style: TextStyle(color: Colors.white),)
          ],
        )
      ],
    );
  }

  Widget _headerSetting() {
    return Padding(padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                        fullscreenDialog: true,
                                        builder: (context) => LoginHomePage(),))
                            },
                            child: ClipOval(
                    child: Image.asset('images/dayCheap_placeholder.png', width: 46, height: 46,fit: BoxFit.fill),
                      ),
                          ),
                          Column(
                            children: [
                              Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 6), child: 
                              Consumer<UserInfo>(
              builder: (context, value, child) {
                // return Text(value.info.name, style: TextStyle(color: Colors.white,fontSize: 16),);
                return Text(value.user.name, style: TextStyle(color: Colors.white,fontSize: 16),);
              },
            ),
                              
                              ),
                              
                              Container(
                                padding: EdgeInsets.fromLTRB(12, 3, 12, 2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                ),
                                child: Text('有效期至2020-09-09',style: TextStyle(fontSize: 9))
                              )
                            ],
                          )
                        ],
                    ),
                    GestureDetector(
                      child: Image.asset('images/setting.png',width: 24, height: 24,)
                    )
                  ],
                ),
              );      
  }

  Widget _topHeader(BuildContext context) {
    return MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: Container(
            child: Stack(
              children: [
                Image.asset('images/vip_head_bg.png'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _headerSetting(),
                    SizedBox(height: 16),
                    _middleFuncs(),
                    SizedBox(height: 13),
                    _bottomVip(),
                  ],
                ),
              ],
            )
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      body:  MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: _topHeader(context)
            ),
            SliverToBoxAdapter(
              child: _middleItems(context)
            ),
            SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 20,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 100,
                    height: 1,
                    color: Colors.grey,
                  ),
                  Text('猜你喜欢'),
                  Container(
                    width: 100,
                    height: 1,
                    color: Colors.grey,
                  ),
                ]
              )
            )
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGrid.count(
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            crossAxisCount: 2,
            childAspectRatio: 0.62,
            children: goods.map((model) => HomeGoods(model: model)).toList(),
          ),
          ),
        ],
      ))
    );
  }
}