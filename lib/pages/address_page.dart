import 'package:RanMall_flutter/model/shopcar_model.dart';
import 'package:RanMall_flutter/pages/add_address_page.dart';
import 'package:RanMall_flutter/pages/widget/address_item.dart';
import 'package:flutter/material.dart';

class AddressListPage extends StatefulWidget {
  AddressListPage({Key key}) : super(key: key);

  @override
  _AddressListPageState createState() => _AddressListPageState();
}

class _AddressListPageState extends State<AddressListPage> {
  List<AddressModel> addressList = [];


  _addAddressClick(BuildContext context) async {
    final result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) {
          return AddAddressPage();
        }
    ));
    print(result);
    addressList.add(result);

    setState(() {
      addressList = addressList;
    });
  }

  Widget _contentSet() {
    if (addressList.length == 0) {
      return Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Container(
            alignment: Alignment.center,
            height:200,
            child: Text('暂无')
          ),
          GestureDetector(
            onTap: () => {
              _addAddressClick(context)
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(width: 0.5,//宽度
                color: Colors.red, //边框颜色
		          ),  
	 	            ),
              ),
              height: 50,
              padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
              margin: EdgeInsets.fromLTRB(0, 0, 0,MediaQuery.of(context).padding.bottom),
              
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 53, 111, 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                child: Text('新增收获地址',style: TextStyle(color: Colors.white),)
              )
            ),
          )
        ],
      );
    } else {
      return Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          ListView.separated(
            itemCount: addressList.length,
            itemBuilder: (ctx, index) {
              return AddressItem(model: addressList[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(height: 1.0, color: Colors.blue,);
            },
          ),
          GestureDetector(
            onTap: () => {
              _addAddressClick(context)
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(width: 0.5,//宽度
                color: Colors.red, //边框颜色
		          ),  
	 	            ),
              ),
              height: 50,
              padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
              margin: EdgeInsets.fromLTRB(0, 0, 0,MediaQuery.of(context).padding.bottom),
              
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 53, 111, 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                child: Text('新增收获地址',style: TextStyle(color: Colors.white),)
              )
            ),
          )
        ],
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context, 'Nope.'),
        ), 
        title: Text('收货地址',style: TextStyle(color: Colors.black,)),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
          ),
      body: _contentSet()
      );
  }
}