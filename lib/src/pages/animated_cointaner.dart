
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key key}) : super(key: key);

  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  @override
  double _width =50.00;
  double _height = 50 ;
  Color  _color = Colors.pink;
  
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);



  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOutCubic,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),
        ) 
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _cambiarForma,
      ),
    );
  }

  void _cambiarForma(){
    setState(() {
      final random = Random();
      _width  = random.nextInt(300).toDouble();
      _height = random.nextInt(600).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256), 
        random.nextInt(256),
        1
      );
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }

}