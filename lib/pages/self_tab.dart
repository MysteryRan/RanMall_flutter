import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class STab extends StatefulWidget {
  // tab 集合
  final List<Widget> tabs;
  // 页面集合
  final List<Widget> pages;

  STab({Key key,this.tabs,this.pages}) : super(key: key);

  @override
  _STabState createState() => _STabState();
}

class _STabState extends State<STab> {
  int selectedIndex = 0;
  SwiperController swipeControl = new SwiperController();
 
  // tab 索引变化回调
  void onTabChange(index) {
    setState(() {
      selectedIndex = index;
    });
    swipeControl.move(index);
  }
 
  void onCancelClick() {
    print('cancel');
  }
 
  void onPageChange(index) {
    setState(() {
      selectedIndex = index;
    });
  }
 
  @override
    Widget build(BuildContext context) {
      return Container(
        child: Column(
          children: [
          TabLayout(widget.tabs, selectedIndex, onTabChange, onCancelClick,context),
          ContentLayout(widget.pages, swipeControl, onPageChange)
        ],
      ));
    }
  }
 
/// 上面 Tab 的布局
  Widget TabLayout(tabs, selectedIndex, onTabChange, onRightButtonClick,context) {
    List<Widget> getItem() {
      List<Widget> children = [];
      for (var i = 0; i < tabs.length; i++) {
        children.add(
          GestureDetector(
            onTap: () {
              onTabChange(i);
            },
            child: Container(
          child: Column(
            children: [ 
              SizedBox(height: 9),
              selectedIndex == i ? Image.asset('images/2_discard_selected.png',width: MediaQuery.of(context).size.width / 10.0,) : 
              Image.asset('images/2_discard_unselected.png',width: MediaQuery.of(context).size.width / 10.0,),
              SizedBox(height: 5),
              selectedIndex == i ? Container(decoration: BoxDecoration(
                color: Color.fromRGBO(255, 53, 111, 1),
                borderRadius: BorderRadius.circular(9)
              ),padding: EdgeInsets.fromLTRB(5, 2, 5, 2) ,child: Text('已选择', style: TextStyle(color: Colors.white),),) : Container(decoration: BoxDecoration(
                color: Colors.transparent
                // borderRadius: BorderRadius.circular(9)
              ),padding: EdgeInsets.fromLTRB(5, 2, 5, 2) ,child: Text('未选择', style: TextStyle(color: Colors.black),),)
            ]
          ),
          )
          ),
        );
      }
      return children;
  }
 
  return Container(
    padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: getItem(),
      ),
    );
  }
 
/// 下面页面内容布局
  Widget ContentLayout(pages, swipeControl, onIndexChanged) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Swiper(
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int index) {
          return pages[index];
        },
        loop: false,
        onIndexChanged: (index) {
        onIndexChanged(index);
        },
        controller: swipeControl,
      )),
    );
  }