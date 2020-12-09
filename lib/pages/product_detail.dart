import 'package:RanMall_flutter/model/home_model.dart';
import 'package:RanMall_flutter/model/shopcar_model.dart';
import 'package:RanMall_flutter/pages/widget/evalue_item.dart';
import 'package:RanMall_flutter/pages/widget/style_choose.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:RanMall_flutter/pages/widget/show_sheet_dialog.dart';

class ProductDetail extends StatefulWidget {
  final HomeGoodsModel model;

  bool isFocus = false;
  String styleString = '颜色分类';
  int currentIndex = 1;

  ProductDetail({Key key, this.model}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        title:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(children: <Widget>[
                Text('商品',style: widget.isFocus ? TextStyle(color: Colors.black, fontSize: 18) : TextStyle(color: Colors.black, fontSize: 14) ),
                SizedBox(width: 20),
                Text('评价',style: TextStyle(color: Colors.black, fontSize: 18),),
                SizedBox(width: 20),
                Text('详情',style: TextStyle(color: Colors.black, fontSize: 18),),
              ],
            ),
          ],
        ),
        centerTitle: false,
        actions: <Widget>[
          Container(padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
              child: Text('编辑', style: TextStyle(fontSize: 14,color: Color.fromRGBO(37, 37, 37, 1))),alignment: Alignment.bottomCenter,),
          ],
        elevation: 0.0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
          ),
      body:
      CustomScrollView(
        slivers: <Widget>[
          this._renderTitle(),
          SliverPadding(
                padding: EdgeInsets.only(left:8.0, right: 8.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => EvalueItem(),
                    childCount: 2,
                  ),
                ),
              )
        ],
      )
    );
  }

  _adjustIndex(int index) {
    setState(() {
      widget.currentIndex = index + 1;
    });
  }

  _renderTitle() {
     List _images = [
    'images/Second_kill_pic_1.png',
    'images/Second_kill_pic_2.png',
    'images/Second_kill_pic_3.png',
    ];
    return SliverToBoxAdapter(
        child: Column(
            // 轮播
            children: [
              // 轮播图
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  AspectRatio(aspectRatio: 1, child: 
                    Container(
                      child: Swiper(
                        onIndexChanged: (index) => {
                          _adjustIndex(index)
                        },
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
                  ),
                  Column(
                    children: [
                      Text('${widget.currentIndex} / 3'),
                      SizedBox(height: 20),
                    ]
                  )
                ]
              ),
              // 基本信息
              Padding(padding: EdgeInsets.only(left: 10, right: 10), 
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text('279934.00',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(255, 53, 111, 1)),),
                          Text('¥99999', style: TextStyle(fontSize: 13,color: Color.fromRGBO(0, 0, 0, 0.8),
                          decoration: TextDecoration.lineThrough, decorationColor: Color.fromRGBO(0, 0, 0, 0.8)))
                        ]
                      ),
                      GestureDetector(
                        onTap: () => {

                        },
                        child: Column(
                          children: [
                            // Image.asset('dd'),
                            Text('降价通知')
                          ]
                        )
                      ),
                    ]
                  ),
                  SizedBox(height: 5),
                  Text('美的（Midea）FB40Simple302电饭煲4L大容量智能家用钻石纹上盖Midea'),
                  SizedBox(height: 12),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset('images/vip_content_bg.png'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(padding: EdgeInsets.only(left: 20),child:
                            Text('您已开通VIP会员享专属优惠',style: TextStyle(color: Colors.white),)
                          ),
                          Padding(padding: EdgeInsets.only(right: 20),child: Row(
                            children: [
                              GestureDetector(
                                child: Row(
                                  
                                  children: [
                                    Text('更多特权', style: TextStyle(color: Color.fromRGBO(240, 218, 145, 1))),
                                    // Image.asset('')
                                  ]
                                )
                              )
                            ],
                          )
                        )  
                      ]
                      )
                    ]
                  )
                ]
              )
            ),
          Container(
            height: 33,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8.0),),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: EdgeInsets.only(left: 10), child: 
                  Row(
                    children: [
                      // Image.asset(''),
                      Text('省钱精选'),
                    ],
                  )
                ),
                
                Row(
                  children: [
                    // Image.asset(''),
                    Text('品质保证'),
                  ],
                ),
                Padding(padding: EdgeInsets.only(right: 10), child: 
                  Row(
                    children: [
                      // Image.asset(''),
                      Text('售后无忧'),
                    ],
                  )
                ),
              ]
            ),
          ),
          SizedBox(
            height: 12
          ),
          Padding(padding: EdgeInsets.only(left: 10, right: 10), 
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: 
            Column(
              children: [
                GestureDetector(
                  onTap: () => {
                    // bottomSheetDialog(context, ShowSheetDialog(items: ["22","333"]))
                    bottomSheetDialog(context, StyleChoose(sureCallBack: selectedItems))
                  },
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10, top: 12,bottom: 10), child: 
                        Row(
                            children: [
                              Text('选择',style: TextStyle(color: Color.fromRGBO(37, 37, 37, 0.4),fontSize: 14)),
                              SizedBox(width: 16),
                              Text('${widget.styleString}'),
                            ]
                          )
                        ),
                        Container(width: 10, height: 10),
                      ] 
                    ),
                  )
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10, top: 12,bottom: 10), child: 
                      Row(
                        children: [
                          Text('发货',style: TextStyle(color: Color.fromRGBO(37, 37, 37, 0.4),fontSize: 14)),
                          SizedBox(width: 16),
                          Text('快递包邮'),
                        ]
                      ),
                    ),
                  ] 
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10, top: 12,bottom: 10), child: 
                      Row(
                        children: [
                          Text('保障',style: TextStyle(color: Color.fromRGBO(37, 37, 37, 0.4),fontSize: 14)),
                          SizedBox(width: 16),
                          Text('付款后24小时'),
                        ]
                      ),
                    ),
                  ] 
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10, top: 12,bottom: 10), child: 
                      Row(
                        children: [
                          Text('参数',style: TextStyle(color: Color.fromRGBO(37, 37, 37, 0.4),fontSize: 14)),
                          SizedBox(width: 16),
                          Text('型号'),
                        ]
                      ),
                    ),
                  ] 
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10, top: 12), child: 
                      Row(
                        children: [
                          Text('品牌',style: TextStyle(color: Color.fromRGBO(37, 37, 37, 0.4),fontSize: 14)),
                          SizedBox(width: 16),
                          Text('美的'),
                        ]
                      ),
                    ),
                  ] 
                ),
                SizedBox(height: 10),
              ]
            ),
          ),
        ),
        
          SizedBox(height: 12,),
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1,color: Color(0xffe5e5e5))),
              color: Colors.white,
            ),
            height:53,
            width: MediaQuery.of(context).size.width - 14,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 12),
                    Text('评价'),
                    Text('(3条)')
                  ]
                ),
                Row(
                  children: [
                    Text('全部评价'),
                    SizedBox(width: 20),
                  ]
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  void selectedItems(StyleModel model){
    setState(() {
      widget.styleString = model.styleName;
    });
  }

  static void bottomSheetDialog(BuildContext context, Widget widget) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return widget;
      },
    );
  }
}