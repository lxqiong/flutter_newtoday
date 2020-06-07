
import 'package:flutter/material.dart';
import 'package:flutter_newtoday/pages/listtextitem.dart';
class Homepage extends StatelessWidget
{
  String pageTitle;
  Homepage({@required title})
  {
    pageTitle=title;
  }
  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Material(
      child: ListView(children: <Widget>[
          Listtextitem(),
          Listtextitem(),
          Listtextitem(),
      ],),
    );
  }
}