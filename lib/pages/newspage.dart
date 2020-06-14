
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Newspage extends StatelessWidget
{
  String newstitle;
  Newspage(String title)
  {
    this.newstitle = title;
  }
  @override
  Widget build(BuildContext context) {

    return WebviewScaffold(url:"https://blog.csdn.net/lxqiong/article/details/106607899",
    appBar: AppBar(title:Text(this.newstitle)),);
  }
}