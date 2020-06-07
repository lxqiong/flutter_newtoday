import 'package:flutter/material.dart';
import 'package:flutter_newtoday/pages/listvideoitem.dart';

class Videopage extends StatefulWidget
{
  @override
  VideopageState createState() => VideopageState();
}

class VideopageState extends State<Videopage>
{
 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        child: ListView(children: <Widget>[
          Listvideoitem(),
          
        ],),
        ),

    );
  }

  
}