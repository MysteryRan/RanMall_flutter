import 'package:RanMall_flutter/model/home_model.dart';
import 'package:flutter/material.dart';

class CategoryNav extends StatelessWidget {
  final List<CategoryModel> localNavList;

  const CategoryNav({Key key,@required this.localNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(242, 242, 242, 1),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 7, bottom: 7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    if (localNavList == null) return null;
    List<Widget> items = [];
    localNavList.forEach((e) {
      items.add(_item(context,e));
    });

    return 
        Container(
          padding: EdgeInsets.only(top: 20,bottom: 14),
      decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child:Wrap(
        runSpacing: 15,
        children: items,
      )
    );
  }

  Widget _item(BuildContext context, CategoryModel model) {
    return GestureDetector(
      onTap: (){

      },
      child: 
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            width: (MediaQuery.of(context).size.width - 14) / 5.0,
            child: Column(children: [
              Image.network(
            model.url,
            width: (MediaQuery.of(context).size.width - 14) / 5.0 - 30,
            height: (MediaQuery.of(context).size.width - 14) / 5.0 - 30
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            model.name,
            style: TextStyle(fontSize: 10,color: Color.fromRGBO(94, 94, 94, 1))
          )]),
        )
    );
  }
}