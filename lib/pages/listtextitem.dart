
import 'package:flutter/material.dart';
import 'package:flutter_newtoday/pages/newspage.dart';

class Listtextitem extends StatelessWidget
{
  Listtextitem(){

  }

  @override
  Widget build(BuildContext context) {
   
    return Column(children: <Widget>[
        Row(children:<Widget>[Container(margin: EdgeInsets.all(10),
        child: InkWell(child:Text("我的博客",style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 10, 10, 10)),),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)
          {
            return Newspage("我的博客");
          }
          ));
        },), 
        ) ], mainAxisAlignment: MainAxisAlignment.start,),
        Image.network("https://imgconvert.csdnimg.cn/aHR0cHM6Ly9tbWJpei5xcGljLmNuL21tYml6X2pwZy8xaFJlSGFxYWZhZmwyYkFBZkhnTHg1SkNLVGljQ2lhZjN1Z0RqcEJHMkU5enVxUTVrZGNMclhpY2wxN2hDZzNjdEZaUE1hcWg3dEhhbGVpY05xM2xJUVNvR1EvNjQw?x-oss-process=image/format,png",height: 100,),
        Row(
         // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(children: <Widget> [IconButton(icon:Icon(Icons.transform),onPressed: (){},),Text("转发"),],),
            Row(children: <Widget> [IconButton(icon:Icon(Icons.comment),onPressed: (){},),Text("1000"),],), 
            Row(children: <Widget> [IconButton(icon:Icon(Icons.thumb_up),onPressed: (){},),Text("2000"),],), 
          ],
        ),
      ],);
  }
}