import 'package:RanMall_flutter/model/shopcar_model.dart';
import 'package:flutter/material.dart';

class AddressItem extends StatefulWidget {
  final AddressModel model;

  AddressItem({Key key,@required this.model}) : super(key: key);

  @override
  _AddressItemState createState() => _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Padding(child: Text('${widget.model.name}      ${widget.model.phone}'),padding: EdgeInsets.all(10),),
                Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 10), child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Text('${widget.model.address}      ${widget.model.detail}'),flex: 9,),
                      Expanded(flex: 1,child: GestureDetector(
                        child: Text('编辑',style: TextStyle(color: Color.fromRGBO(255, 53, 111, 1)),)
                      ))
                    ],
                  ),)
              ]
    ));
  }
}