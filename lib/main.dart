import 'package:flutter/material.dart';
import 'package:flutter_newtoday/pages/homepage.dart';
import 'package:flutter_newtoday/pages/videopage.dart';
import 'package:flutter_newtoday/pages/searchbar.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '今日晚点',
      theme: ThemeData(
        primarySwatch: Colors.redAccent[300],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AviHomePage(title: '今日晚点'),
    );
  }
}

class AviHomePage extends StatefulWidget {
  AviHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  AviHomePagePageState createState() => AviHomePagePageState();
}

class AviHomePagePageState extends State<AviHomePage> with TickerProviderStateMixin
{
  int _bottomIndex= 0;


  List<Widget> widgetPage=[Homepage(title:"home"),Videopage(),];
  void setbottomindex(int index) {
    setState(() {
      this._bottomIndex=index;
    });
  }



   @override
  void initState() {

    super.initState();
    
  } 
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: SearchBar(),
      body: widgetPage[this._bottomIndex],
    bottomNavigationBar:BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home),title:Text("主页",)),
        BottomNavigationBarItem(icon: Icon(Icons.business),title:Text("冬瓜视频")),
        BottomNavigationBarItem(icon: Icon(Icons.home),title:Text("热榜")),
        BottomNavigationBarItem(icon: Icon(Icons.home),title:Text("小视频")),
        BottomNavigationBarItem(icon: Icon(Icons.home),title:Text("未登录")),],
        currentIndex: this._bottomIndex,
        type: BottomNavigationBarType.fixed,
        // unselectedFontSize: 18,
        selectedItemColor: Colors.blue,
       backgroundColor: Colors.white ,
       onTap: (int index)
       {
         setbottomindex(index);
       },
    ), 
    );
  }
}
