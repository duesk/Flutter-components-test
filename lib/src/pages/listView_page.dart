import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  List<int> _listaNumeros = new List() ;
  int _ultimoItem = 0;
  bool _isLoading = false;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() { 
    super.initState();
    _agregar5();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //_agregar5();
        fetchData();
      }
    });
  }

  @override
  void dispose() { 
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      )
    );
  }

  Widget _crearLista(){
    return RefreshIndicator(
          onRefresh: obtenerPagina1,
          child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index ){
          final imagen = _listaNumeros[index];
          return FadeInImage(
            image: NetworkImage("https://picsum.photos/id/$imagen/500/400"),
            placeholder: AssetImage("assets/jar-loading.gif"),
          );
        },
      ),
    );
  }

  Future<Null> obtenerPagina1() async{
    final duration =new Duration(seconds: 2);
    new Timer(duration, (){
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar5();
    });
    return Future.delayed(duration);
  }


  void _agregar5(){
    for (var i = 0; i < 5; i++) {
      print(_ultimoItem);
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {
      
    });
  }

  Future fetchData() async{

    _isLoading =true;
    setState(() {});
    
    final duration = new Duration( seconds: 3);
    return new Timer(duration , respuestaHTTP);

  }

  void respuestaHTTP(){
    _isLoading =false;

    _scrollController.animateTo(
      _scrollController.position.pixels+100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 800)
    );

    _agregar5();
  }

  Widget _crearLoading(){

    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0,)
        ],
      );
    }else {
      return Container();
    }
  }

}