import 'package:RanMall_flutter/model/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ProductDetail extends StatefulWidget {
  final HomeGoodsModel model;

  bool isFocus = false;

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
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(child: Text('111')),
              childCount: 5,
            ), itemExtent: 106,
          ),
        ],
      )
    );
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
                      Text('10086'),
                      SizedBox(height: 20),
                    ]
                  )
                ]
              ),
              // 基本信息
              Column(
                children: [

                ]
              )
                
        
        ]
      ),
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  

}