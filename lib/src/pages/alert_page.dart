import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text( "Mostrar Alerta"),
          textColor: Colors.white,
          color: Colors.blue,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlert(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child : Icon(Icons.arrow_back),
        onPressed : (){
          Navigator.pop(context);
        }

      ),
    );
  }

  void _mostrarAlert(BuildContext context){
    showDialog(
      context: context, 
      barrierDismissible: true,  // se puede serra la alerta dando click afuera
      builder: (context) {
        return AlertDialog(
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text("hola"),
          content: Column (
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("este es el contenido de la alerta "),
            FlutterLogo(size:100.0)
          ]
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("cancelar") ,
              onPressed: () => Navigator.pop(context),
            ),
            FlatButton(
              child: Text("ok"),
              onPressed: ()=> Navigator.pop(context),
            )
          ],
        );
      }
    );
  }


}