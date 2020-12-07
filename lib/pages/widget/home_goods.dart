import 'package:RanMall_flutter/model/home_model.dart';
import 'package:RanMall_flutter/pages/product_detail.dart';
import 'package:flutter/material.dart';

class HomeGoods extends StatefulWidget {
    final HomeGoodsModel model;
    HomeGoods({Key key,@required this.model}) : super(key: key);

    @override
    _HomeGoodsState createState() => _HomeGoodsState();
}

class _HomeGoodsState extends State<HomeGoods> {

  Future<void> _customShowMyDialog(BuildContext context, HomeGoodsModel model) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(model.product_name),
                Text(model.sales_volume),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
                _toProductDetail(context);
              },
            ),
          ],
        );
      },
    );
  }

  _toProductDetail(BuildContext context) {
     Future result = Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) {
          return ProductDetail();
        }
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        // _toProductDetail(context)
        _customShowMyDialog(context, widget.model)
      },
      child: Container(
        padding: EdgeInsets.only(left: 2, top: 2, right: 2),
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                // 图片
                Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                        AspectRatio(aspectRatio: 1,
                        child:Image.network('http://18sheng.71baomu.com/' + widget.model.image_url,fit: BoxFit.cover),
                        ),
                        widget.model.product_name.length > 10 ? Text('限时折扣正在进行',style: TextStyle(color: Colors.white,backgroundColor: Colors.red),) : Text('',style: TextStyle(backgroundColor: Colors.red),),
                    ]
                ),
                SizedBox(height: 8),
                // title
                Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Text(widget.model.product_name, overflow: TextOverflow.ellipsis,maxLines: 2,textAlign: TextAlign.left)
                ),
                SizedBox(height: 12),
                // 价格
                Container(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('¥' + widget.model.spec_price_yuan, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16))
                ),
                Container(
                    padding: EdgeInsets.only(left: 8,right: 8),
                    child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                            Text('¥' + widget.model.vip_price_yuan,style: TextStyle(fontSize: 12,color: Color.fromRGBO(180, 40, 45, 1))),
                            Text('已售' + widget.model.sales_volume, style: TextStyle(fontSize: 10,color: Color.fromRGBO(145, 145, 145, 1))),
                        ]
                    ),
                ),
               
                SizedBox(height: 12),
            ]
        )
      )
    );
  }
}