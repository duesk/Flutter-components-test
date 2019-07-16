import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  static final pageName = "avatar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://vignette.wikia.nocookie.net/moviedatabase/images/8/8c/Tony_Stark.jpg/revision/latest?cb=20150430161420"),
              radius:20.0,
            ) 
          ),

          Container(
            margin:EdgeInsets.only(right: 10.0) ,
            child: CircleAvatar(
              child: Text("sl"),
              backgroundColor: Colors.purple,
            )
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage("https://www.futuro.cl/wp-content/uploads/2019/06/avengers-endgame-5cefd77ce6ad9-web-590x340.jpg"),
          placeholder: AssetImage("assets/jar-loading.gif"),
          fadeInDuration: Duration(milliseconds: 900),
        ),
      ),
    );
  }
}