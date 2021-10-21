import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearckech = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        child: Column(
          children: [
            _crearSlider(),
            _checkbox(),
            _crearSwith(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.indigo,
        label: 'Tamaño de la imagen',
        value: _valorSlider,
        min: 10.0,
        max: 400.0,
        onChanged: (_bloquearckech)
            ? null
            : (valor) {
                setState(() {
                  _valorSlider = valor;
                });
              });
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://muzikalia.com/wp-content/uploads/2018/11/stan-lee.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _checkbox() {
    /*return Checkbox(
        value: _bloquearckech,
        onChanged: (valor) {
          setState(() {
            _bloquearckech = valor;
          });
        });*/

    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearckech,
      onChanged: (valor) {
        setState(() {
          _bloquearckech = valor;
        });
      },
    );
  }

  Widget _crearSwith() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearckech,
      onChanged: (valor) {
        setState(() {
          _bloquearckech = valor;
        });
      },
    );
  }
}
