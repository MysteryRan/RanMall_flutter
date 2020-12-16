import 'package:RanMall_flutter/model/home_model.dart';
import 'package:RanMall_flutter/model/shopcar_model.dart';
import 'package:RanMall_flutter/pages/mine_page.dart';
import 'package:RanMall_flutter/pages/sure_order_page.dart';
import 'package:RanMall_flutter/pages/widget/home_goods.dart';
import 'package:RanMall_flutter/service/home_request.dart';
import 'package:RanMall_flutter/tool/user_default.dart';
import 'package:RanMall_flutter/tool/user_tool.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final List<ShopCarModel> tempShopCars = [
  ShopCarModel(checked:false, count: 1,shopCarID: '1'),
  ShopCarModel(checked:false, count: 2,shopCarID: '2'),
  ShopCarModel(checked:false, count: 3,shopCarID: '3'),
  ShopCarModel(checked:false, count: 4,shopCarID: '4'),
];

class ShopCar extends StatelessWidget {
  const ShopCar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(children: <Widget>[
              Container(
              child: Text('购物车',style: TextStyle(color: Colors.black, fontSize: 18),)           
              ),
              ],
            ),
          ],
        ),
        centerTitle: true,
        actions: <Widget>[
          Container(padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
              child: Text('编辑', style: TextStyle(fontSize: 14,color: Color.fromRGBO(37, 37, 37, 1))),alignment: Alignment.bottomCenter,),
          ],
        elevation: 0.0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
          ),
      body:
        ShopCarContent(),
    );
  }
}

class ShopCarContent extends StatefulWidget {
  ShopCarContent({Key key}) : super(key: key);

  @override
  _ShopCarContentState createState() => _ShopCarContentState();
}

class _ShopCarContentState extends State<ShopCarContent> {
  List<ShopCarModel> shopcars = [];
  // 选中的购物车
  List<ShopCarModel>  selectedShopCars = [];
  List<HomeGoodsModel> goods = [];

  String showMoney = '';

  void selectedItems(ShopCarModel model){
    setState(() {
      if (selectedShopCars.contains(model)) {
        selectedShopCars.remove(model);
      } else {
        selectedShopCars.add(model);
      }
    });
    _totalMoney();
  }

  // 跳转详情
  Future<void> _jumpToDetail(BuildContext context) async {
    if (selectedShopCars.length < 1) {
      showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('选择要结算的商品'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
      return;
    }
    // 1. 普通的跳转方式
    // 传递参数: 通过构造器直接传递即可          包裹到router里面 
    // Future result = Navigator.of(context).push(MaterialPageRoute(
    //     builder: (ctx) {
    //       return SureOrderPage(shopCars: selectedShopCars,);
    //     }
    // ));

    // 返回时 调用方法
    // await Navigator.of(context).push(MaterialPageRoute(
    //     builder: (ctx) {
    //       return ProductDetail();
    //     }
    // ));

    await Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => SureOrderPage(shopCars: selectedShopCars,),
          //跳转的页面必须设置 name（路由名字） 才会允许别的页面指定返回到此页面
          settings: RouteSettings(name: "here"),
        ),);
    // selectedShopCars = [];
    setState(() {
      selectedShopCars = [];
    });

    Provider.of<UserInfo>(context, listen: false).initShopCars();
    
  }

  void countAdjust(ShopCarModel model){
    setState(() {
      if (selectedShopCars.contains(model)) {
        selectedShopCars.remove(model);
        selectedShopCars.add(model);
      } 
      
    });
    _totalMoney();
  }

  _totalMoney() {
    String money = '';
    double moneyCount = 0.00;
    for (var item in selectedShopCars) {
      moneyCount += item.count * 15;
    }
    money = moneyCount.toString();
    setState(() {
      showMoney = money;
    });
  }

  _selectedAll() {
    selectedShopCars = [];
    for (var item in shopcars) {
      selectedShopCars.add(item);
    }
    setState(() {
      selectedShopCars = selectedShopCars;
    });
  }

  Widget _adjustBottomBar() {
    if (selectedShopCars.length > 0) {
      return Container(
        padding: EdgeInsets.only(left: 15),
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => {
                    _selectedAll()
                  },
                  child: Image.asset('images/checked.png',width: 18, height: 18),
                ),
                Text('已选(${selectedShopCars.length})')
              ]
            ),
            Row(
              children: [
                Text('合计:'),
                Text('¥$showMoney',style: TextStyle(color: Color.fromRGBO(255, 53, 111, 1), fontWeight: FontWeight.bold),),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () => {
                    _jumpToDetail(context)
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Color.fromRGBO(255, 53, 111, 1),
                    height: 50,
                    padding: EdgeInsets.only(left: 35, right: 35),
                    child: Text('结账',style: TextStyle(color: Colors.white, fontSize: 14),),
                  )
                )
              ],
            )
          ]
        )
      );
    } else {
      return Container();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    HomeRequest.requestGoods().then((value) {
      setState(() {
        goods.addAll(value);
      });
    });

    // setState(() {
    //   shopcars = tempShopCars;
    // });

    var userSet = UserDefault();
    userSet.getStorage('name').then((value) => print(value));

    Provider.of<UserInfo>(context, listen: false).initShopCars();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(242, 242, 242, 1),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(height: 12)
          ),
          Consumer<UserInfo>(
              builder: (context, value, child) {
                return SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => 
              shopCarItem(model: value.tempShopcars[index],selectedCallBack: selectedItems, countCallBack: countAdjust,),
              childCount: value.tempShopcars.length,
            ), itemExtent: 106,
          );
              },
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
      ),
      
      _adjustBottomBar()

      ],
      )
    );
  }
}

class shopCarItem extends StatefulWidget {
  final ShopCarModel model;
  final ValueChanged<ShopCarModel> selectedCallBack;
  final ValueChanged<ShopCarModel> countCallBack;
  shopCarItem({Key key, @required this.model, this.selectedCallBack, this.countCallBack}) : super(key: key);

  @override
  _shopCarItemState createState() => _shopCarItemState();
}

class _shopCarItemState extends State<shopCarItem> {
  @override
  void initState() { 
    super.initState();
    
    // Provider.of<UserInfo>(context, listen: false).chooseCurrentModel(widget.model);

  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('detial');
      },
      child: Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 12),
      margin: EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: 
        [ GestureDetector(
          onTap: (){
            // Provider.of<UserInfo>(context, listen: false).modelCheckedAdjust(widget.model);
            // print(widget.model);
            setState(() {
              widget.model.checked = !widget.model.checked;
            });
            // if (widget.model.checked) {
              widget.selectedCallBack(widget.model);
            // }
          },
          child:  widget.model.checked ? Image.asset('images/checked.png', width: 18, height: 18) : Image.asset('images/check.png', width: 18, height: 18)
          
          
          // Consumer<UserInfo>(
          //     builder: (context, value, child) {
          //       // return Text(value.info.name, style: TextStyle(color: Colors.white,fontSize: 16),);
          //       return value.currentModel.checked ? Image.asset('images/checked.png', width: 18, height: 18) : Image.asset('images/check.png', width: 18, height: 18);
          //     },
          //   ),
          
          
        ),
        SizedBox(width: 12),
        Image.asset('images/dayCheap_placeholder.png', width: 82, height: 82),
        SizedBox(width: 12),
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Rawpockets脖子深蓝色恩格斯历险含糊其词磷化圆领T恤',maxLines: 2,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Color.fromRGBO(247, 247, 247, 1),
              ),
              child: Row(
                children: [
                  Text('黑色'),
                  SizedBox(width: 5),
                  Text('128G'),
                ],
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('¥:15.00',style: TextStyle(color: Color.fromRGBO(229, 53, 43, 1),fontSize: 16,fontWeight: FontWeight.bold)),
                Container(
                  child: Row(
                    children:[
                      GestureDetector(
                        onTap: () {
                          if (widget.model.count == 1) {
                            return;
                          }
                          setState(() {
                            widget.model.count -= 1;
                          });
                          widget.countCallBack(widget.model);
                        },
                        child: Image.asset('images/delete.png', width: 20, height: 20),
                      ),
                      Container(
                        color: Color.fromRGBO(247, 247, 247, 1),
                        padding: EdgeInsets.only(left:10, right: 10),
                        child:Text(widget.model.count.toString(),style: TextStyle(backgroundColor: Color.fromRGBO(247, 247, 247, 1)),),
                        ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.model.count += 1;
                          });
                          widget.countCallBack(widget.model);
                        },
                        child: Image.asset('images/add.png', width: 20, height: 20),
                      ),
                    ]
                  )
                )
              ]
            )
          ]
        )
        )
        
        ]
      ),
    )
    );
  }
}