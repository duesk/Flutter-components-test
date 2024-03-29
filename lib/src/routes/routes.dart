
import 'package:components/src/pages/Slider_page.dart';
import 'package:components/src/pages/animated_cointaner.dart';
import 'package:components/src/pages/cards_page.dart';
import 'package:components/src/pages/input_page.dart';
import 'package:components/src/pages/listView_page.dart';
import 'package:flutter/material.dart';


import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/avatar_page.dart';
import 'package:components/src/pages/home_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes(){

return <String, WidgetBuilder>{
  '/' : (BuildContext context) => HomePage(),
  'alert': (BuildContext context) => AlertPage(),
  AvatarPage.pageName: (BuildContext context)=> AvatarPage(),
  'card': (BuildContext context) => CardPage(),
  'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
  'inputs': (BuildContext context) => InputPage(),
  "slider"  : (BuildContext context) => SliderPage(),
  "list"  : (BuildContext context) => ListaPage(),
  

};

}


