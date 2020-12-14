import 'package:RanMall_flutter/model/shopcar_model.dart';
import 'package:RanMall_flutter/pages/pay_page.dart';
import 'package:RanMall_flutter/tool/user_tool.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SureOrderPage extends StatefulWidget {
  final List<ShopCarModel> shopCars;

  SureOrderPage({Key key,@required this.shopCars}) : super(key: key);

  @override
  _SureOrderPageState createState() => _SureOrderPageState();
}

class _SureOrderPageState extends State<SureOrderPage> {

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context, 'Nope.'),
        ), 
        title: Text('确认订单',style: TextStyle(color: Colors.black,)),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
          ),
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
                Container(
              color: Color.fromRGBO(242, 242, 242, 1),
              child: ListView(
                children: [
                  _addressInfo(context),
                  _products(context),
                ]
              )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0,MediaQuery.of(context).padding.bottom),
              padding: EdgeInsets.fromLTRB(0, 13, 0, 16),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('应付金额:'),
                  SizedBox(width: 20),
                  Text('32323'),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: ()=> {
                    //  Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (ctx) {
                    //       return GestureDetector(
                    //         onTap: ()=>{
                    //           Navigator.popUntil(context,  ModalRoute.withName('/shopCar'))
                    //         },
                    //         child: Container(
                    //           child: Text('sdsdsd')
                    //         )
                    //       );
                    //     }
                    // ))
                      // Navigator.of(context).pushNamedAndRemoveUntil('/pay',ModalRoute.withName('/home'))
    //                   Navigator.of(context).push(MaterialPageRoute(
    //     builder: (ctx) {
    //       return PayPage();
    //     }
    // ))           

                    Provider.of<UserInfo>(context, listen: false)
                      .finishPay(widget.shopCars),

                    Navigator.of(context).pushReplacementNamed("/pay")

                    },
                    child: Container(
                    padding: EdgeInsets.fromLTRB(28, 7, 28, 7),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  gradient: LinearGradient(
                colors: [Color.fromRGBO(255, 79, 39, 1), Color.fromRGBO(255, 53, 111, 1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
                    child: Text('去付款',style: TextStyle(color: Colors.white,fontSize: 16),)
                  )
                  )
                ]
              )
            ),
        ],
      )

      );
  }

  Widget _addressInfo(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0), child:  Container(
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Column(
        children: [
          SizedBox(height:12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(width:15),
              Image.asset('images/2_discard_selected.png',width: 23, height: 23),
              SizedBox(width:15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('王大鸽（先生） 136****3098'),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Text('浙江省杭州市西湖区西城博司（9幢7楼）浙江省杭州市西湖区西城博司（9幢7楼',maxLines: 2)
                  )
                  
                ],
              )
            ]
          ),
          SizedBox(height:26),
        ],
      )
      
    ));
  }

  Widget _products(BuildContext context) {







    return Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),child: 
    Container(
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Wrap(
        children: [
          for ( var i in widget.shopCars ) Padding(padding: EdgeInsets.fromLTRB(0, 20, 10, 10), child: 
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                Image.asset('images/dayCheap_placeholder.png',width: 80, height: 80,),
                SizedBox(width: 10),
                Expanded(flex: 2, child: Column(
                  children: [
                    Text('美的FB40Simple302电饭煲 4L大容量 智能家用钻…'),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      padding: EdgeInsets.fromLTRB(7.5, 0, 7.5, 0),
                      child: Text('型号型号型号型号型号型号型 型号型号型号型号型号型号…', style: 
                      TextStyle(color: Color.fromRGBO(112, 112, 112, 1),fontSize: 11),)
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 240, 241, 1),
                          ),
                          padding: EdgeInsets.fromLTRB(7.5, 0, 7.5, 0),
                          child: Text('型号型',style: TextStyle(color: Color.fromRGBO(255, 94, 135, 1),fontSize: 11),)
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 240, 241, 1),
                          ),
                          padding: EdgeInsets.fromLTRB(7.5, 0, 7.5, 0),
                          child: Text('型号型',style: TextStyle(color: Color.fromRGBO(255, 94, 135, 1),fontSize: 11),)
                        ),
                      ],
                    )
                  ]
                ),
                ),
                Expanded(flex: 1, child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                   Text('¥999999.00'),
                    Text('x2')
                  ],
                ),
                ),
              ]
            )
          ))
        ],
      ),
    ));
  }
}



