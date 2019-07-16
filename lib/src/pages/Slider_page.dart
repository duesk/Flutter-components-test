import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.00;
  int  _valorInt = 1;
  String _valorTexto = "";
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders")
      ),
      body: Container(
        padding:EdgeInsets.only(top: 55.00),
        child: Column(
          children: <Widget>[
            Text("selector"),
            _crearSlider(),
            _checkbox(),
            _checkSwitch(),
            Expanded(child: _crearImagen())
          ],
        )
      ),
    );
  }

  Widget _crearSlider(){
    return Slider(
      activeColor:Colors.indigoAccent,
      divisions: 400,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      label:" valor: $_valorTexto",
      onChanged: (_bloquearCheck)? null : (valor){ //Expresion ternaria
        setState(() {
          _valorInt =valor.toInt() ;
          _valorTexto=_valorInt.toString();
          _valorSlider = valor;
        });
      },
    );
  }


Widget _checkbox(){

  // return Checkbox(
  //   value: _bloquearCheck,
  //   onChanged: (valor){
  //     setState(() {
  //     _bloquearCheck = valor;  
  //     });
  //   },
  // );

  return CheckboxListTile(
    title: Text("Desactivar Slider"),
    value: _bloquearCheck,
    onChanged: (valor){
      setState(() {
      _bloquearCheck = valor;  
      });
    },
  );

}

Widget _checkSwitch(){

  return SwitchListTile(
    title: Text("Desactivar Slider"),
    value: _bloquearCheck,
    onChanged: (valor){
      setState(() {
      _bloquearCheck = valor;  
      });
    },
  );

}


  Widget _crearImagen(){

    return Image(
      image: NetworkImage("http://pngimg.com/uploads/ironman/ironman_PNG37.png"),
      width: _valorSlider,
      fit: BoxFit.contain,
    );

  }


}