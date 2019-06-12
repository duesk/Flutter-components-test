import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ["uno","Dos","tres","cuatro","cinco","uno","Dos","tres","cuatro","cinco","uno","Dos","tres","cuatro","cinco","uno","Dos","tres","cuatro","cinco","uno","Dos","tres","cuatro","cinco","uno","Dos","tres","cuatro","cinco"];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Componentes temp")
      ),
      body: ListView(
        children: _crearListaCorta(),
        
      ),
    );
  }

  List<Widget> _crearItems(){
    
    List<Widget> lista = new List<Widget> ();

    for (String opt in opciones) {
      final tempWidget = ListTile( 
        title: Text(opt),
      );
      lista.add(tempWidget);
      lista.add(Divider());
    }
    return lista; 
  }

  List<Widget>_crearListaCorta(){

    return opciones.map( ( item ){

      return Column(
        children: <Widget>[
          ListTile( 
            title: Text(item+"!"),
            subtitle: Text("subtitulo"),
            leading: Icon(Icons.memory),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
            
          ),
          Divider(),

        ],
      ); 
    }).toList();

  }




}