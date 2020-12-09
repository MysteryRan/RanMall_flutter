import 'package:flutter/material.dart';


class SearchBar extends StatefulWidget {
  final String city;
  final bool enabled;
  final bool hideLeft;
  final bool autofocus;
  final String hint; //默认提示文案
  final String defaultText;
  final void Function() leftButtonClick;
  final void Function() rightButtonClick;
  final void Function() speakClick;
  final void Function() inputBoxClick;
  final ValueChanged<String> onChanged;

  const SearchBar({
    Key key,
    this.enabled = true,
    this.hideLeft,
    this.autofocus = false,
    this.hint,
    this.defaultText,
    this.leftButtonClick,
    this.rightButtonClick,
    this.speakClick,
    this.inputBoxClick,
    this.onChanged,
    this.city,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool showClear = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.defaultText != null) {
      _controller.text = widget.defaultText;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _genHomeSearch;
  }

  Widget get _genHomeSearch {
    final TextEditingController _controller = TextEditingController();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
           Icon(
            Icons.search,
            size: 20,
            color:Color(0xffa9a9a9),
          ),
          Text("搜索商品总有一款你会喜欢", style: TextStyle(color: Colors.grey, fontSize: 14),)
        ],
      ),
    );
  }

  Widget get _inputBox {
    Color inputBoxColor;
    
    inputBoxColor = Colors.white;
    return Container(
      height: 30,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.search,
            size: 20,
            color:Color(0xffa9a9a9),
          ),
          Expanded(
              flex: 1,
              child: TextField(
                      controller: _controller,
                      onChanged: _onChanged,
                      autofocus: widget.autofocus,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          backgroundColor: Colors.blue,
                          fontWeight: FontWeight.w300),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(5, -15, 5, 0),
                          border: InputBorder.none,
                          hintText: '搜索商品总有一款你会喜欢',
                          hintStyle: TextStyle(fontSize: 15)),
                    )
                  )
        ],
      ),
    );
  }

  Color get _homeFontColor {
    return Colors.black54;
  }

  //输入框内容改变
  void _onChanged(String text) {
    if (text.length > 0) {
      setState(() {
        showClear = true;
      });
    } else {
      setState(() {
        showClear = false;
      });
    }
    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
  }
}
