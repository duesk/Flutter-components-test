import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cards "),
      ),
      body: ListView(
        //padding:EdgeInsets.only(left: 8,right: 15, top: 25) ,
        padding: EdgeInsets.all(10),
        //padding: EdgeInsets.symmetric(horizontal: 15),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 10.0,),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo, color: Colors.black),
            title: Text("hola soy un titulo"),
            subtitle: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nibh urna, porttitor eget augue vel, pharetra dapibus enim. Ut sollicitudin interdum blandit. Sed malesuada nunc."),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Cancelar",style: TextStyle(color: Colors.red)),
                onPressed: (){}
              ),
              FlatButton(
                child: Text("Aceptar", style: TextStyle(color: Colors.green),),
                onPressed: (){},
              )
            ],
          )
        ],
      ) 
    );
  }

  Widget _cardTipo2(){
    
    return Card(
      child: Column(
        children: <Widget>[
          Image(
            image: NetworkImage("https://astanatimes.com/wp-content/uploads/2018/01/Part_3.jpeg"),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("texto de image")
          )
        ],
      ),
    );

  }
} 