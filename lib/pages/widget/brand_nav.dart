import 'package:RanMall_flutter/model/home_model.dart';
import 'package:flutter/material.dart';

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

class BrandBanner extends StatefulWidget {
  final List<BrandModel> brandList;
  BrandBanner({Key key, @required this.brandList}) : super(key: key);

  @override
  _BrandBannerState createState() => _BrandBannerState();
}

class _BrandBannerState extends State<BrandBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: (MediaQuery.of(context).size.width - 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
       child: Container(
         child: Column(
          children:[
            SizedBox(height: 17),
            Text('热门品牌，正品直供',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            Text('超过80个热门品牌',style: TextStyle(color: Color.fromRGBO(145, 145, 145, 1),fontSize: 12),),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                   Container(
                     width:  MediaQuery.of(context).size.width - 14,
                      child: Container(
          padding: EdgeInsets.only(top: 9,bottom: 14, left: 7),
          child: Wrap(
            children: _brands(context)
          ),
      decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
    ),
                  ),
                  Container(
                     width:  MediaQuery.of(context).size.width - 14,
                      child: Container(
          padding: EdgeInsets.only(top: 9,bottom: 14, left: 7),
          child: Wrap(
            children: _brands(context)
          ),
      decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
    ),
                  ),
                ]
              ),
            )
          ]
        ),
       )
       
    );
  }

  _items(BuildContext context) {
    if (widget.brandList == null) return ListView();
    if (widget.brandList.length == 0) return ListView();
    List<Widget> items = [];
    for (var i = 0; i < 10; i++) {
      items.add(_item(context, widget.brandList[1]));
    }

    return 
        Container(
          padding: EdgeInsets.only(top: 9,bottom: 14),
      decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child:Wrap(
        runSpacing: 2,
        spacing: 2,
        children: items,
      )
    );
  }

  List<Widget> _brands(BuildContext context) {
    List<Widget> items = [];
    for (var i = 0; i < 10; i++) {
      items.add(_singleItem(context));
    }
    return items;
  }

  Widget _item(BuildContext context, BrandModel model) {
    return GestureDetector(
      onTap: (){

      },
      child: 
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: new Border.all(color: Color.fromRGBO(145, 145, 145, 1), width: 0.5),
            ),
            width: (MediaQuery.of(context).size.width - 30) / 5.0,
            child: Column(
              children: [
              Image.network(
                'http://18sheng.71baomu.com/uploads/brand/1/2020-11-19-15-56-01-5fb625117b0a0.png',
            width: (MediaQuery.of(context).size.width - 30) / 5.0 - 30,
            height: (MediaQuery.of(context).size.width - 30) / 5.0 - 30
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'deee',
            style: TextStyle(fontSize: 10,color: Color.fromRGBO(94, 94, 94, 1))
          )]),
        )
    );
  }

  Widget _singleItem(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: 
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: new Border.all(color: Color.fromRGBO(145, 145, 145, 1), width: 0.5),
            ),
            width: (MediaQuery.of(context).size.width - 30) / 5.0,
            child: Column(
              children: [
              Image.network(
                'http://18sheng.71baomu.com/uploads/brand/1/2020-11-19-15-56-01-5fb625117b0a0.png',
            width: (MediaQuery.of(context).size.width - 30) / 5.0 - 30,
            height: (MediaQuery.of(context).size.width - 30) / 5.0 - 30
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'deee',
            style: TextStyle(fontSize: 10,color: Color.fromRGBO(94, 94, 94, 1))
          )]),
        )
    );
  }
}