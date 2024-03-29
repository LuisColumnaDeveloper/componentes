import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body:Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
              ),
              
          ],
        ),
        
      ) ,
    );
  }

  Widget _crearSlider() {
    
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      //divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: ( _bloquearCheck ) ?  null: ( valor ){
        print(valor);

        setState(() {
          _valorSlider = valor; 
        });

      },
    );
  }

  Widget _crearCheckBox(){

    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: ( valor ){
    //     setState(() {
    //         _bloquearCheck = valor;  
    //     });
    //   },
    // );

    return CheckboxListTile(
      value: _bloquearCheck,
      title: Text('Bloquear slider'),
      onChanged: ( valor ){
        setState(() {
            _bloquearCheck = valor;  
        });
      },
    );
  }

  Widget _crearSwitch(){

    return SwitchListTile(
      value: _bloquearCheck,
      title: Text('Bloquear slider'),
      onChanged: ( valor ){
        setState(() {
            _bloquearCheck = valor;  
        });
      },
    );
  }


  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://purepng.com/public/uploads/large/purepng.com-batman-arkham-knightbatmansuperherocomicdc-comicsbob-kanebat-manbruce-wayne-1701528525691kseuf.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}