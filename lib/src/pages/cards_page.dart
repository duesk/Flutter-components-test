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
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo, color: Colors.black),
            title: Text("hola soy un titulo"),
            subtitle: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nibh urna, porttitor eget augue vel, pharetra dapibus enim. Ut sollicitudin interdum blandit. Sed malesuada nunc."),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
    
    final card =  Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage("https://astanatimes.com/wp-content/uploads/2018/01/Part_3.jpeg"),
            placeholder: AssetImage("assets/jar-loading.gif"),
            //fadeInDuration: Duration(milliseconds: 10),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          //Image(
          //  image: NetworkImage("https://astanatimes.com/wp-content/uploads/2018/01/Part_3.jpeg"),
          //),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("texto de image")
          )
        ],
      ),
    );
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 10.0,
            offset: Offset(0.0, 19)
          )
        ],
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white
      ),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(20.0),        
      ),
    );
  }
} 