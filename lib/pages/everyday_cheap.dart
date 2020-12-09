import 'package:RanMall_flutter/pages/widget/every_cheap_item.dart';
import 'package:flutter/material.dart';
//导入 swiper组件
import 'package:flutter_swiper/flutter_swiper.dart';

class EverydayCheapPage extends StatefulWidget {
  @override
  _EverydayCheapPageState createState() => _EverydayCheapPageState();
}

class _EverydayCheapPageState extends State<EverydayCheapPage>
    with SingleTickerProviderStateMixin {
  //滚动的控制器
  ScrollController _scrollController;
  // 选项卡控制器
  TabController _tabController;
  //  初始化滑动器
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 0.0);
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
    _tabController.dispose();
  }

   Widget renderTitle(String title) {
    return SliverToBoxAdapter(
      child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Image.asset('images/cheap_bg.png'), 
                Positioned(child: Image.asset('images/cheap_top_image.png',width: 74, height: 65),top: 20, left: 35),
                Positioned(child: Text('钜惠直降 24小时限时优惠',style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),), right: 50, top: 32,),    
                Padding(padding: EdgeInsets.only(bottom: 17), child: 
                  Container(
                    height: 56,
                    color: Colors.white,
                    child: Wrap(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 5.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 9),
                              Image.asset('images/2_discard_selected.png',width: MediaQuery.of(context).size.width / 5.0 / 2.0,),
                              SizedBox(height: 5),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 53, 111, 1),
                                  borderRadius: BorderRadius.all(Radius.circular(9)),
                                ),
                                padding: EdgeInsets.only(left: 6, right: 6),
                                child: Text('已结束',style: TextStyle(color: Colors.white, fontSize: 13),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 5.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 9),
                              Image.asset('images/2_discard_unselected.png',width: MediaQuery.of(context).size.width / 5.0 / 2.0,),
                              SizedBox(height: 5),
                              Container(
                                decoration: BoxDecoration(
                                  // color: Color.fromRGBO(255, 53, 111, 1),
                                  // borderRadius: BorderRadius.all(Radius.circular(9)),
                                ),
                                padding: EdgeInsets.only(left: 6, right: 6),
                                child: Text('已结束',style: TextStyle(color: Colors.black, fontSize: 13),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 5.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 9),
                              Image.asset('images/2_discard_unselected.png',width: MediaQuery.of(context).size.width / 5.0 / 2.0,),
                              SizedBox(height: 5),
                              Container(
                                decoration: BoxDecoration(
                                  // color: Color.fromRGBO(255, 53, 111, 1),
                                  // borderRadius: BorderRadius.all(Radius.circular(9)),
                                ),
                                padding: EdgeInsets.only(left: 6, right: 6),
                                child: Text('已结束',style: TextStyle(color: Colors.black, fontSize: 13),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 5.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 9),
                              Image.asset('images/2_discard_unselected.png',width: MediaQuery.of(context).size.width / 5.0 / 2.0,),
                              SizedBox(height: 5),
                              Container(
                                decoration: BoxDecoration(
                                  // color: Color.fromRGBO(255, 53, 111, 1),
                                  // borderRadius: BorderRadius.all(Radius.circular(9)),
                                ),
                                padding: EdgeInsets.only(left: 6, right: 6),
                                child: Text('已结束',style: TextStyle(color: Colors.black, fontSize: 13),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 5.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 9),
                              Image.asset('images/2_discard_unselected.png',width: MediaQuery.of(context).size.width / 5.0 / 2.0,),
                              SizedBox(height: 5),
                              Container(
                                decoration: BoxDecoration(
                                  // color: Color.fromRGBO(255, 53, 111, 1),
                                  // borderRadius: BorderRadius.all(Radius.circular(9)),
                                ),
                                padding: EdgeInsets.only(left: 6, right: 6),
                                child: Text('已结束',style: TextStyle(color: Colors.black, fontSize: 13),),
                              )
                            ],
                          ),
                        ),
                      ] 
                    ),
                  )
                )
              ]
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ), 
          elevation: 1.0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text('天天双十一',style: TextStyle(fontSize: 18.0,color: Colors.black),),
        ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Color.fromRGBO(200, 107, 255, 1), Color.fromRGBO(111, 117, 255, 1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
            ),
            CustomScrollView(
              slivers: <Widget>[
                this.renderTitle('SliverList'),
                SliverFixedExtentList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => EveryCheapItem(),
                    childCount: 5,
                  ), itemExtent: 150,
                ),
              ],
            )
          ]
        )
    );
  }
}



