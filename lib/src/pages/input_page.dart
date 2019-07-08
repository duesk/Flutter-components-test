import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  String _nombre =" ";
  String _email =" ";
  String _fecha = " ";

  TextEditingController _dateSelectorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text("Inputs") ),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            _crearInput(),
            Divider(),
            _crearEmail(),
            Divider(),
            _crearPassword(),
            Divider(),
            _crearFecha(context),
            Divider(),
            _crearPersona(),

          ],
        ),
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
      title: Text('nombre es : $_nombre'),
      subtitle: Text("Email: $_email"),
    );
  // return  Text('nombre es : $_nombre');  
  }

  Widget _crearEmail()
{
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
      firstDate: DateTime.now(),
      initialDate: DateTime(2000),
      lastDate: DateTime(2020)
    );
    if( picked != null ){
      setState(() {
      _fecha = picked.toString();
      _dateSelectorController.text = _fecha;
      
      });
    }

  }


}