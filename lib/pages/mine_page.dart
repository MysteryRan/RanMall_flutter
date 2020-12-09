import 'package:flutter/material.dart';
//导入 swiper组件
import 'package:flutter_swiper/flutter_swiper.dart';
class MinePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MinePage>
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
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.orange),
      child: Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          centerTitle: true,
          title: Text('首页',style: TextStyle(fontSize: 24.0,color: Colors.white),),
        ),
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                //吸顶
                pinned: true,
                floating: true,
                expandedHeight: 280,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    height: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        _buildButtons(),
                        _buildTabBarBg()
                      ],
                    ),
                  ),
                ),
                bottom: TabBar(controller: _tabController, tabs: [
                  Tab(text: "鉴定",),
                  Tab(text: "古玩",),
                  Tab(text: "瓷器",),
                  Tab(text: "收藏",),
                  Tab(text: "乐趣",),
                ],
                  isScrollable: true,
                  indicatorColor: Color(0xffff0000),
                  indicatorWeight: 1,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.only(bottom: 10.0),
//                  labelPadding: EdgeInsets.only(left: 20),
                  labelColor: Color(0xff333333),
                  labelStyle: TextStyle(
                    fontSize: 15.0,
                  ),
                  unselectedLabelColor: Colors.yellowAccent,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              )
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              _buildListView("鉴定:"),
              _buildListView("古玩:"),
              _buildListView("瓷器:"),
              _buildListView("收藏:"),
              _buildListView("乐趣:"),
            ],
          ),
        ),
      ),
    );
  }

//  banner下面的按钮
  Widget _buildButtons() {
    // 定义横着的 按钮
    return Card(
      elevation: 5.0,
      child: Container(
        height: 70,
        child: Row(
          children: <Widget>[
            _buildButtonItem(Icons.arrow_back, '捡漏街'),
            _buildButtonItem(Icons.map, '古玩城'),
            _buildButtonItem(Icons.label, '古铜器'),
            _buildButtonItem(Icons.access_alarm, '老佛堂'),
            _buildButtonItem(Icons.add_a_photo, '老瓷器'),
          ],
        ),
      ),

    );
  }

  //接受上面传递的参数
  Widget _buildButtonItem(IconData icon, String text) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.pink,
            size: 28.0,
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 12.0),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTabBarBg() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(bottom: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          // 修饰选项卡背景图
         color: Colors.grey[400],
        ),
      ),
    );
  }

  Widget _buildListView(String s) {
    return ListView.separated(
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) =>
            Divider(
              color: Colors.grey,
              height: 1,
            ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              color: Colors.white,
              child: ListTile(title: Text("$s第$index 个条目")));
        });
  }
}