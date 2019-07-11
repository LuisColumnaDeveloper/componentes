import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Alert Avatar'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://www.tattoofun.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/s/q/squirtle_sm.jpg'),
              radius: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://www.tattoofun.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/s/q/squirtle_sm.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif') ,
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}