import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  SearchBar({
    Key key,
    this.leading,
    this.title,
    this.onCancel,
    this.onSearch,
    this.top_controller,
  }) : super(key: key);
  final Widget leading;

  // 标题 
  final String title;

  // 点击取消回调
  final VoidCallback onCancel;

  // 点击键盘搜索回调
  final ValueChanged<String> onSearch;
  final TabController top_controller;

  @override
  Widget build(BuildContext context) {
    return _AppBar(
      key: key,
      leading: leading,
      title: title,
      onSearch: onSearch,
      onCancel: onCancel,
      top_controller:top_controller,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBar extends StatefulWidget {
  _AppBar({
    Key key,
    this.leading,
    this.title,
    this.onCancel,
    this.onSearch,
    this.top_controller,
  }) : super(key: key);

  // 头部组件 可选
  final Widget leading;

  // 标题 可选
  final String title;

  // 点击取消回调 可选
  final VoidCallback onCancel;

  // 点击键盘搜索回调 可选
  final ValueChanged<String> onSearch;
  final TabController top_controller;

  @override
  _AppBarState createState() => _AppBarState(topController: this.top_controller);
}

class _AppBarState extends State<_AppBar> with TickerProviderStateMixin{
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  bool _showSearch = false; // 显示搜索框
  int _topIndex=0;
  List _topTabs =["关注","推荐","杭州","视频"];
  TabController topController; 
  _AppBarState({this.topController})
  {}
  void settopndex(int index) {
    setState(() {
      this._topIndex=index;
    });
  }
  void onTapChange()
  {
    setState(() {
      this._topIndex = this.topController.index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    
    //this.topController= TabController(initialIndex: 0,length: this._topTabs.length,vsync: this,); 
    //this._topController.addListener(()=>onTapChange());
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _focusNode?.dispose();
    super.dispose();
  }

  // 搜索面板 默认返回标题
  Widget _searchPanel() {
    String _title = widget.title ?? "";
    if (_title.isNotEmpty && !_showSearch) return Text(_title);
    ValueChanged<String> _onSearch = widget.onSearch ?? (val) {};
    return Container(
      height: kToolbarHeight - 25,
      child: TextField(
        focusNode: _focusNode,
        controller: _controller,
        autofocus: _title.isNotEmpty,
        style: TextStyle(fontSize: 15),
        textInputAction: TextInputAction.search,
        onEditingComplete: () => _onSearch(_controller.text),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }

  // 搜索/取消按钮
  Widget _action() {
    String _title = widget.title ?? "";
    VoidCallback _onCancel = widget.onCancel ?? () {};
    Widget _icon =
        _title.isNotEmpty && !_showSearch ? Icon(Icons.search) : Text('发布');
    return Container(
      width: 30,
      margin: EdgeInsets.only(right: 10),
      child: IconButton(
        padding: EdgeInsets.all(0),
        icon: _icon,
        onPressed: () {
          setState(() {
            if (_title.isNotEmpty) _showSearch = !_showSearch;
          });
          if (!_showSearch) {
            _focusNode.unfocus();
            _controller.clear();
            _onCancel();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.leading,
      title: _searchPanel(),
      actions: <Widget>[_action()],
      bottom: TabBar(
          controller: this.topController,
          tabs:_topTabs.map((e) => Text(e)).toList(),
          ),
    );
  }
}