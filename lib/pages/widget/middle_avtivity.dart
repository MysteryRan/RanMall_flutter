import 'package:RanMall_flutter/pages/everyday_cheap.dart';
import 'package:RanMall_flutter/pages/special_goods.dart';
import 'package:flutter/material.dart';

class EveryDayCheap extends StatelessWidget {
  const EveryDayCheap({Key key}) : super(key: key);

  _toEverydayCheap(BuildContext context) {
     Future result = Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) {
          return EverydayCheapPage();
        }
    ));
  }

  @override
  Widget build(BuildContext context) {
    // return Image.asset('images/home_cheap_bg.png',
    //                 width: 80, height: 80);
    Paint paintRed = Paint();
    paintRed.color = Colors.red;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: ()=> {
              _toEverydayCheap(context)
            },
            child: Container(
            child: Stack(
              children: [
                  Image.asset('images/home_cheap_bg.png',width: (MediaQuery.of(context).size.width - 21) / 2.0,),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text('天天双十一',style: TextStyle(color: Colors.white,fontSize: 14)),
                          SizedBox(width: 4),
                          Container( child: Text("钜惠直降",style: TextStyle(color: Colors.white,fontSize: 10)),
                              decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(9)),
                                        gradient: LinearGradient(
                                      colors: [Color.fromRGBO(112, 104, 255, 1), Color.fromRGBO(210, 120, 255, 1)],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.bottomRight,
                                    )),
                              padding: EdgeInsets.only(left: 10, right: 10))
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          // fit: StackFit.expand,
                          children: [
                            Image.asset('images/dayCheap_placeholder.png'),
                            Text('钜惠直降 24小时限时优惠', style: TextStyle(color: Colors.white, fontSize: 10,backgroundColor: Colors.red))
                          ],
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Wrap(
                          spacing: 5,
                          alignment: WrapAlignment.spaceAround,
                          children: [
                            Container(
                              child: Stack(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  // fit: StackFit.expand,
                                  children: [
                                      Image.asset('images/dayCheap_placeholder.png',width: ((MediaQuery.of(context).size.width - 21) / 2.0 - 26) / 2,),
                                      Text('限时优惠', style: TextStyle(color: Colors.white, fontSize: 10,backgroundColor: Colors.red))
                                    ],
                              ),
                            ),
                            Container(
                              child: Stack(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  // fit: StackFit.expand,
                                  children: [
                                      Image.asset('images/dayCheap_placeholder.png',width: ((MediaQuery.of(context).size.width - 21) / 2.0 - 26) / 2,),
                                      // Container(
                                      //   width: ((MediaQuery.of(context).size.width - 21) / 2.0 - 26) / 2,
                                        // child: 
                                        Text('限时优惠', style: TextStyle(color: Colors.white, fontSize: 10,backgroundColor: Colors.red)),
                                      // )
                                    ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
              ],
            ),
            width: (MediaQuery.of(context).size.width - 21) / 2.0,
            decoration: BoxDecoration(
              color: Colors.white
            ),
          ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AspectRatio(aspectRatio: 173.0 / 134.0,
                          child:Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 10, right: 10,bottom: 10,top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('限时抢购',style: TextStyle(color: Colors.black,fontFamily: 'monospace',
              fontSize: 14.0,
              fontWeight: FontWeight.bold,),),
                          Row(
                            children: [
                              SizedBox(width: 5),
                              Container( child: Text("04",style: TextStyle(color: Colors.white,fontSize: 10)),
                              color: Color.fromRGBO(255, 53, 111, 1),
                              ),
                              Text(":"),
                              Container( child: Text("04",style: TextStyle(color: Colors.white,fontSize: 10)),
                              color: Color.fromRGBO(255, 53, 111, 1),
                              ),
                              Text(":"),
                              Container( child: Text("04",style: TextStyle(color: Colors.white,fontSize: 10)),
                              color: Color.fromRGBO(255, 53, 111, 1),
                              ),
                            ]
                          )
                        ],
                      ),
                      Text("每天十点开抢", style: TextStyle(color: Color.fromRGBO(255, 53, 111, 1), fontSize: 11, fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('images/dayCheap_placeholder.png',width: ((MediaQuery.of(context).size.width - 21) / 2.0 - 26) / 2,),
                          Image.asset('images/dayCheap_placeholder.png',width: ((MediaQuery.of(context).size.width - 21) / 2.0 - 26) / 2,)
                        ],
                      )
                    ],
                  ),
                ),
                ),
                
                SizedBox(height: 10),
                AspectRatio(aspectRatio: 173.0 / 134.0,
                          child: GestureDetector(
                        onTap: () {
                          Future result = Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) {
                                return SpecialGoodsPage();
                              }
                          ));
                        },
                        child:
                          Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 10, right: 10,bottom: 10,top: 10),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('甄选好物',style: TextStyle(color: Colors.black,fontFamily: 'monospace',
              fontSize: 14.0,
              fontWeight: FontWeight.bold,),),
                          Row(
                            children: [
                              SizedBox(width: 5),
                              Container(child: Text("超值抢购",style: TextStyle(color: Colors.white,fontSize: 10)),
                              decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(9)),
                                        gradient: LinearGradient(
                                      colors: [Color.fromRGBO(254, 72, 79, 1), Color.fromRGBO(254, 128, 36, 1)],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.bottomRight,
                                    )),
                              padding: EdgeInsets.only(left: 10, right: 10),
                              ),
                              
                            ]
                          )
                        ],
                      ),
                      Text("精选每日品质好货", style: TextStyle(color: Color.fromRGBO(255, 53, 111, 1), fontSize: 11, fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('images/dayCheap_placeholder.png',width: ((MediaQuery.of(context).size.width - 21) / 2.0 - 26) / 2,),
                          Image.asset('images/dayCheap_placeholder.png',width: ((MediaQuery.of(context).size.width - 21) / 2.0 - 26) / 2,)
                        ],
                      )
                    ],
                  ),
                      ),
                ),)
              ],
            ),
            width: (MediaQuery.of(context).size.width - 21) / 2.0,
            
          ),
        ]
      )
    );
  }
}