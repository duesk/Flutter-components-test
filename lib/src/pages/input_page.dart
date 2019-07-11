import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  String _nombre =" ";
  String _email =" ";
  String _fecha = " ";
  
  String _estadoSeleccionado = "soltero";
  List<String> _estadoCivil = ["soltero","casado","divorciado","viudo"];

  TextEditingController _dateSelectorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text("Inputs") ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _crearInput(),
            Divider(),
            _crearEmail(),
            Divider(),
            _crearPassword(),
            Divider(),
            _crearFecha(context),
            Divider(),
            _crearDropDown(),
            Divider(),
            _crearPersona(),

          ],
        ),
    );
  }

  List<DropdownMenuItem<String>>getOpcionesDropdown() {

    List<DropdownMenuItem<String>>lista = [];
    _estadoCivil.forEach((estado){
      lista.add(DropdownMenuItem(
        child: Text(estado),
        value: estado,
      ));
    });
    return lista;

  }

  Widget _crearDropDown(){
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 10,),
        DropdownButton(
          value: _estadoSeleccionado,
          items: getOpcionesDropdown(),
          onChanged:(opt){
            setState(() {
              _estadoSeleccionado = opt;
            });
          } 
        ),
      ],
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,   // posiciona el cursor automaticamente 
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(10.0)
        ),
        counter:Text("Letras ${_nombre.length}"),
        hintText: "Nombre",
        labelText: "Nombre",
        helperText: "ingrese solo el nombre",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.person),
        // filled: true,
        // fillColor: Colors.blue[100],
      ),
      onChanged: (valor)=> setState(() {
          _nombre =valor ;
        })
    );

  }

  Widget _crearPersona (){
    return ListTile(
      title: Text('Nombre es : $_nombre'),
      subtitle: Text("Email: $_email"),
      trailing: Text("Esatdo Civi: $_estadoSeleccionado"),
    );
  // return  Text('nombre es : $_nombre');  
  }

  Widget _crearEmail(){
  return TextField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius:BorderRadius.circular(10.0)
      ),
      hintText:  "Email",
      labelText: "Email",
      suffixIcon: Icon(Icons.alternate_email),
      icon: Icon(Icons.email),
    ),
    onChanged: (valor){
      setState(() 
        {
          _email=valor;
        }
      );
    },
  );
}

Widget _crearPassword(){
    return TextField(
    obscureText: true,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius:BorderRadius.circular(10.0)
      ),
      hintText:  "Password",
      labelText: "Password",
      suffixIcon: Icon(Icons.lock_open),
      icon: Icon(Icons.lock),
    ),
    onChanged: (valor){
      setState(() 
        {
          
        }
      );
    },
  );
}


Widget _crearFecha(BuildContext context){

    return TextField(
      enableInteractiveSelection: false,
      controller: _dateSelectorController,
      decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius:BorderRadius.circular(10.0)
      ),
      hintText:  "Fecha de nacimiento",
      labelText: "Fecha de nacimiento",
      suffixIcon: Icon(Icons.perm_contact_calendar),
      icon: Icon(Icons.calendar_today),
    ),
    onTap: (){
      FocusScope.of(context).requestFocus(new FocusNode());
      _selectDate(context);
    },
  );
}


  _selectDate( BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2020),
      locale: Locale("es","ES") 
    );
    if( picked != null ){
      setState(() {
      _fecha = picked.toString();
      String _fechaFormat = _dateFormat(_fecha);
      _dateSelectorController.text = _fechaFormat;
      
      });
    }

  }

  _dateFormat(String _fecha){
    String formatText="";
    for( var i=0 ; i <= 9; i++ ) { 
      formatText= formatText + _fecha[i];
    } 
    return formatText;
  }


}