import 'package:flutter/material.dart';
import "package:flutter_ijkplayer/flutter_ijkplayer.dart";

class Listvideoitem extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => Listvideostate();
}

class Listvideostate extends State<Listvideoitem>
{
   IjkMediaController videoController = IjkMediaController();
   
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoController.setNetworkDataSource("http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/gear2/prog_index.m3u8",autoPlay: false);

  }
   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildMediaPlayer();
  }

  Widget buildMediaPlayer()
  {
     return Column(
        
        children: <Widget>[
         Container(
            margin: EdgeInsets.all(10),
            height: 150,
            child:  IjkPlayer(mediaController: videoController,)
          ),
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
