import 'package:RanMall_flutter/model/shopcar_model.dart';
import 'package:flutter/material.dart';

final List<StyleModel> styleOne  = [
  StyleModel(checked:false, count: 1,styleName: '1145335'),
  StyleModel(checked:false, count: 1,styleName: '2234554'),
  StyleModel(checked:false, count: 1,styleName: '3364554'),
  StyleModel(checked:false, count: 1,styleName: '4445423'),
  StyleModel(checked:false, count: 1,styleName: '22345'),
  StyleModel(checked:false, count: 1,styleName: '33645'),
  StyleModel(checked:false, count: 1,styleName: '44454'),
  StyleModel(checked:false, count: 1,styleName: '46696'),
  StyleModel(checked:false, count: 1,styleName: '9389509535'),
];

class StyleChoose extends StatefulWidget {
  final ValueChanged<StyleModel> sureCallBack;

  StyleChoose({Key key, this.sureCallBack}) : super(key: key);

  @override
  _StyleChooseState createState() => _StyleChooseState();
}

class _StyleChooseState extends State<StyleChoose> {
  List<StyleModel> firstStyles = [];

  @override
  void initState() { 
    super.initState();
    
    setState(() {
      firstStyles = styleOne;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
         mainAxisSize: MainAxisSize.min,
         mainAxisAlignment: MainAxisAlignment.end,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Padding(padding: EdgeInsets.only(left: 10, right: 10), child: 
            Text('规格一')
           ,),
           
           SizedBox(height: 5),
           Padding(padding: EdgeInsets.only(left: 10, right: 10), child: 
            _setStyleOne()
           ,),
          SizedBox(height: 90),
          GestureDetector(
            onTap: () {
              _sureChoose();
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              color: Color.fromRGBO(255, 53, 111, 1),
              child: Text('确定',style: TextStyle(color: Colors.white),),
            )
          )
         ]
       ),
    );
  }

  _sureChoose() {
    for (var item in firstStyles) {
      if (item.checked) {
        widget.sureCallBack(item);
        Navigator.of(context).pop();
        return;
      }
    } 
  }


  _styleItemClick(StyleModel item) {
    for (var model in firstStyles) {
      model.checked = false;
      if (item.styleName == model.styleName) {
        model.checked = true;
      }
    }
    setState(() {
      firstStyles = firstStyles;
    });
  }

  Widget _setStyleOne() {
      return  Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          for ( var i in firstStyles )
            GestureDetector(
              onTap: () {
                _styleItemClick(i);
              },
              child: Container(
                        padding: EdgeInsets.only(left: 19, right: 19),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: i.checked ? Color.fromRGBO(255, 53, 111, 1) : Color.fromRGBO(190, 190, 190, 1), width: 0.5),
                        ),
                        child: Text(i.styleName.toString()),
                      ),
            )
        ]
      );
    
    }
}