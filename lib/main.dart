import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/avatar_page.dart';

import 'package:components/src/routes/routes.dart';
import 'package:flutter/material.dart';

import 'package:components/src/pages/home_page.dart';
//import 'package:components/src/pages/home_temp.dart';

  
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Componentes App',
      //home:  HomePage(),
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings ){
        print("ruta presionada ${settings.name} ");
        
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()

        );

      },
        
    );
  }
} 