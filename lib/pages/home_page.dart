import 'package:RanMall_flutter/model/home_model.dart';
import 'package:RanMall_flutter/pages/widget/brand_nav.dart';
import 'package:RanMall_flutter/pages/widget/category_nav.dart';
import 'package:RanMall_flutter/pages/widget/home_goods.dart';
import 'package:RanMall_flutter/pages/widget/middle_avtivity.dart';
import 'package:RanMall_flutter/pages/widget/search_bar.dart';
import 'package:RanMall_flutter/service/home_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

final List<Color> colorList = [
  Colors.red,
  Colors.orange,
  Colors.green,
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.pink,
  Colors.teal,
  Colors.deepPurpleAccent
];

class RanHomePage extends StatelessWidget {
  String resultString = '';
  List<CategoryModel> categorys = [];

  @override
  Widget build(BuildContext context) {
    List<Tab> tab = <Tab>[
    Tab(
      text: "精选",
    ),
    Tab(
      text: "热卖",
    ),
    Tab(
      text: "热卖",
    ),
    Tab(
      text: "热卖",
    ),
    Tab(
      text: "热卖",
    ),
    Tab(
      text: "热卖",
    ),
    Tab(
      text: "热卖",
    ),
    Tab(
      text: "热卖",
    ),
    Tab(
      text: "热卖",
    ),
    Tab(
      text: "热卖",
    )

  ];

    return DefaultTabController(
      length: tab.length,
      child: Scaffold(
      appBar: AppBar(title:
        Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x66000000), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Container(
            height: 34,
            decoration: BoxDecoration(
                color:
                    Color.fromARGB((1 * 255).toInt(), 255, 255, 255)),
            child: SearchBar(
              // inputBoxClick: _jumpToSearch,
              // speakClick: _jumpToSpeak,
              // defaultText: SEARCH_BAR_DEFAULT_TEXT,
              // leftButtonClick: _jumpToCity,
              // city: city,
            ),
          ),
        ),
        // Container(
        //   height: 1 > 0.2 ? 0.5 : 0,
        //   decoration: BoxDecoration(
        //       boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)]),
        // )
      ],
    ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(255, 53, 111, 0.8),
        brightness: Brightness.light,
        bottom: 
            TabBar(
              indicatorColor: Colors.white,//选中下划线颜色,如果使用了indicator这里设置无效
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              isScrollable: true,
              tabs: tab.map((item)=>Tab(text: item.text,)).toList(),
            ),
          ),
      body: TabBarView(children: tab.map((Tab tab) {
            return RanHomeContent();
          }).toList()),
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
    ),
    );
  }
}


class RanHomeContent extends StatefulWidget {
  List<CategoryModel> categorys;

  @override
  _RanHomeContentState createState() => _RanHomeContentState();
}

class _RanHomeContentState extends State<RanHomeContent> with AutomaticKeepAliveClientMixin {
  List<CategoryModel> categorys = [];
  List<HomeGoodsModel> goods = [];
  List<BrandModel> brands = [];

  ScrollController _scrollController = ScrollController();

  @override
  void initState() { // 初始化状态
    super.initState();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      }
    });

    // 监听键盘弹起
    
  }

  @override
  void dispose() {
    super.dispose();
    // _scrollController.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    if (mounted) {
        // 种类
        HomeRequest.requestCategory().then((value) {
            setState(() {
                categorys.addAll(value);
            });
        });
        // 商品
        HomeRequest.requestGoods().then((value) {
            setState(() {
              goods.addAll(value);
            });
        });
        // 品牌
        HomeRequest.requestBrand().then((value) {
            brands.addAll(value);
        });
    }
}

  Widget renderTitle() {
    List _images = [
    'images/Second_kill_pic_1.png',
    'images/Second_kill_pic_2.png',
    'images/Second_kill_pic_3.png',
    ];
    return SliverToBoxAdapter(
        child: Column(
            // 轮播
            children: [
                Container(padding: EdgeInsets.only(top: 5),
                    height: 138,
                    child: Swiper(
                      itemCount: _images.length,
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset(
                          _images[index],
                          fit: BoxFit.fill,
                        );
                      },
                      pagination: SwiperPagination(),
                    ),
                  ),
        // 种类九宫格
        CategoryNav(localNavList: categorys),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          // 天天双11 活动
          child: EveryDayCheap(),
        ),
        BrandBanner(brandList: brands), 
        // AspectRatio(aspectRatio: 355.0 / 220.0, child:
        // Container(padding: EdgeInsets.only(top: 5),
        //     height: 220,
        //     child: Swiper(
        //         itemCount: _images.length,
        //         autoplay: false,
        //         itemBuilder: (BuildContext context, int index) {
        //         return BrandBanner(brandList: brands);
        //         },
        //         pagination: SwiperPagination(),
        //     ),
        //     ),
        // ),
        
        ]
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _handleRefresh,
        child: Padding(padding: EdgeInsets.only(left: 7, right: 7),
        child: CustomScrollView(
        slivers: <Widget>[
          this.renderTitle(),
          SliverGrid.count(
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            crossAxisCount: 2,
            childAspectRatio: 0.62,
            children: goods.map((model) => HomeGoods(model: model)).toList(),
          ),
        ],
      )
      ),
    );
  }

  loadData() async {
    try {
     List<CategoryModel> result =  await HomeRequest.requestCategory();
    
    } catch (e) {

    }
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    // ignore: unused_element
    setState() {

    }
    return null;
  }

  @override
  bool get wantKeepAlive => true;
}