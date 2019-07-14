import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email  = '';
  String _fecha  = '';
  String _opcionSeleccionada  = 'Volar';

  List<String> _poderes = ['Volar','Rayos x','Super Aliento','Super fuerza'];
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),

      ),
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
          _crearDropWown(),
          Divider(),
          _crearPersona(),
          
          
        ],
      ),
    );
  }

 Widget _crearInput() {
   return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras :${ _nombre.length }'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Sólo es el nombre',
        suffixIcon: Icon (Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
        
        setState(() {
          _nombre = valor;  
        });
      },
   );
  }

Widget  _crearPersona() {
  

return ListTile(
  title: Text('Nombre es : $_nombre'),
  subtitle: Text('Email: $_email'),
  trailing: Text(_opcionSeleccionada),
);
}

  Widget _crearEmail() {

    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
       
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon (Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (valor) => setState(() {
          _email = valor;  
        })
      ,
   );

  }

 Widget  _crearPassword() {
   return TextField(
      obscureText: true,//para contraseña ***
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
       
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon (Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (valor) => setState(() {
          _email = valor;  
        })
      ,
   );
 }

  Widget _crearFecha( BuildContext context) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
       
        hintText: 'fecha de nacimiento',
        labelText: 'fecha de nacimiento',
        suffixIcon: Icon (Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );

      },
      
   );

  }
   _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES')
    );

    if( picked != null){

      setState(() {

        //_fecha = picked.toString();
          //DateTime now = DateTime.now(_fecha);
          //implementar en el pubspec.yaml para el formato de fecha
          //intl: ^0.15.8
        String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
        _inputFieldDateController.text = formattedDate;

      });

    } 

  }

  
  
  List<DropdownMenuItem<String>> getOpcionesDropDown(){

    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder){
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,

      ));
    });

    return lista;
  }

  Widget _crearDropWown() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        Expanded(
              child: DropdownButton(
              value: _opcionSeleccionada,
              items: getOpcionesDropDown(),
              onChanged: (item){
                
                setState(() {
                _opcionSeleccionada = item; 
                });

              },
      ),
        )
      ],
    );

  }

  
}