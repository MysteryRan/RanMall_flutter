import 'package:RanMall_flutter/pages/everyday_cheap.dart';
import 'package:RanMall_flutter/pages/self_tab.dart';
import 'package:RanMall_flutter/pages/widget/every_cheap_item.dart';
import 'package:RanMall_flutter/pages/widget/middle_avtivity.dart';
import 'package:flutter/material.dart';

class SpecialGoodsPage extends StatefulWidget {
  @override
  _SpecialGoodsPageState createState() => _SpecialGoodsPageState();
}

class _SpecialGoodsPageState extends State<SpecialGoodsPage> {

  //  初始化滑动器
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ), 
          title: Text('甄选好物',style: TextStyle(fontSize: 20.0,color: Colors.black),),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Container(
                color: Colors.redAccent,
                height: 48.0,
              ),
            ),
          ),
        body: STab(
          tabs: [
          Text('', style: TextStyle(fontSize: 18, color: Colors.black),),
          Text('', style: TextStyle(fontSize: 18, color: Colors.black)),
          Text('', style: TextStyle(fontSize: 18, color: Colors.black),),
          Text('', style: TextStyle(fontSize: 18, color: Colors.black)),
          Text('', style: TextStyle(fontSize: 18, color: Colors.black),),
          ],
          pages: [CheapPage(),CheapPage(),CheapPage(),CheapPage(),CheapPage()],
                  ),
                ));
  }
}

class CheapPage extends StatefulWidget {
  CheapPage({Key key}) : super(key: key);

  @override
  _CheapPageState createState() => _CheapPageState();
}

class _CheapPageState extends State<CheapPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Color.fromRGBO(200, 107, 255, 1), Color.fromRGBO(111, 117, 255, 1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
       child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: SizedBox(height: 10),
                ),
                SliverFixedExtentList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => EveryCheapItem(),
                    childCount: 7,
                  ), itemExtent: 150,
                ),
              ],
            )
    );
  }
}



