import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/avatar_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:components/src/routes/routes.dart';
import 'package:flutter/material.dart';

import 'package:components/src/pages/home_page.dart';
//import 'package:components/src/pages/home_temp.dart';

  
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en',"EN"), // English
          const Locale('es',"ES"), // Hebrew
        ],
      
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