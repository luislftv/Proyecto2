import 'dart:ui';
import 'package:flutter/material.dart';

var fecha = 'Selecciona la fecha';
var fecha1;
DateTime ayer = DateTime.now().subtract(const Duration(days: 1));
String gUsuario;

class ConsultarPartido extends StatefulWidget {
  ConsultarPartido({Key key}) : super(key: key);

  @override
  _ConsultarPartidoState createState() => _ConsultarPartidoState();
}

class _ConsultarPartidoState extends State<ConsultarPartido> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Consultar Partido',
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          /*child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.top),*/
          child: Container(
            color: Colors.blueGrey[100],
            //constraints: BoxConstraints(maxHeight: 750),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                MesaId(),
                Participante1(),
                Participante2(),
                Ganador(),
                Ronda(),
                fechaProgramada(context),
                horaInicio(context),
                horaFin(context),
                Ronda(),
                //Expanded(child: SizedBox()),
                BotonBuscarParticipante(),
              ],
            ),
            //),
          ),
        ));
  }

  Widget fechaProgramada(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Fecha programada:'),
        Container(
          constraints:
              BoxConstraints(maxWidth: 200, maxHeight: 60, minHeight: 60),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.fromLTRB(13, 12, 12, 12),
          child: GestureDetector(
              child: Row(children: [
                Text(
                  '$fecha',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Icon(Icons.calendar_today_rounded)
              ]),
              onTap: () async {
                fecha1 = await showDatePicker(
                  locale: const Locale('es', 'ES'),
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: ayer,
                  lastDate: DateTime.now(),
                  useRootNavigator: false,
                );
                fecha1 = fecha1.toString();
                if (fecha1 != 'null') {
                  fecha = fecha1;
                  fecha = fecha.substring(0, 10).trim();
                }

                setState(() {});
                print(fecha);
              }),
          margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20),
        ),
      ],
    );
  }

  Widget horaInicio(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Hora inicio:'),
        Container(
          constraints:
              BoxConstraints(maxWidth: 200, maxHeight: 60, minHeight: 60),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.fromLTRB(13, 12, 12, 12),
          child: GestureDetector(
              child: Row(children: [
                Text(
                  '$fecha',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Icon(Icons.calendar_today_rounded)
              ]),
              onTap: () async {
                fecha1 = await showDatePicker(
                  locale: const Locale('es', 'ES'),
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: ayer,
                  lastDate: DateTime.now(),
                  useRootNavigator: false,
                );
                fecha1 = fecha1.toString();
                if (fecha1 != 'null') {
                  fecha = fecha1;
                  fecha = fecha.substring(0, 10).trim();
                }

                setState(() {});
                print(fecha);
              }),
          margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20),
        ),
      ],
    );
  }

  Widget horaFin(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Hora fin:'),
        Container(
          constraints:
              BoxConstraints(maxWidth: 200, maxHeight: 60, minHeight: 60),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.fromLTRB(13, 12, 12, 12),
          child: GestureDetector(
              child: Row(children: [
                Text(
                  '$fecha',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Icon(Icons.calendar_today_rounded)
              ]),
              onTap: () async {
                fecha1 = await showDatePicker(
                  locale: const Locale('es', 'ES'),
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: ayer,
                  lastDate: DateTime.now(),
                  useRootNavigator: false,
                );
                fecha1 = fecha1.toString();
                if (fecha1 != 'null') {
                  fecha = fecha1;
                  fecha = fecha.substring(0, 10).trim();
                }

                setState(() {});
                print(fecha);
              }),
          margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20),
        ),
      ],
    );
  }
}

class MesaId extends StatelessWidget {
  //late int i;
  @override
  Widget build(BuildContext context) {
    var _controller;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Mesa Id:'),
        Container(
          constraints:
              BoxConstraints(maxWidth: 200, maxHeight: 60, minHeight: 60),
          child: TextField(
            controller: _controller,
            onChanged: (String value) {
              gUsuario = value;
            },
            autofocus: false,
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                //borderSide: BorderSide(color: Colors.black)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                //borderSide: BorderSide(color: Colors.black)
              ),
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                //fontStyle: FontStyle.italic,
              ),
              fillColor: Colors.white,
              filled: true,
              //hintText: hintText,
              labelText: 'Usuario',
              //suffixIcon: Icon(icono1),
              //icon: Icon(icono2, color: Colors.white)),
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20),
        ),
      ],
    );
  }
}

class Participante1 extends StatelessWidget {
  //late int i;
  @override
  Widget build(BuildContext context) {
    var _controller;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Participante 1:'),
        Container(
          constraints:
              BoxConstraints(maxWidth: 200, maxHeight: 60, minHeight: 60),
          child: TextField(
            controller: _controller,
            onChanged: (String value) {
              gUsuario = value;
            },
            autofocus: false,
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                //borderSide: BorderSide(color: Colors.black)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                //borderSide: BorderSide(color: Colors.black)
              ),
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                //fontStyle: FontStyle.italic,
              ),
              fillColor: Colors.white,
              filled: true,
              //hintText: hintText,
              labelText: 'Usuario',
              //suffixIcon: Icon(icono1),
              //icon: Icon(icono2, color: Colors.white)),
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20),
        ),
      ],
    );
  }
}

class Participante2 extends StatelessWidget {
  //late int i;
  @override
  Widget build(BuildContext context) {
    var _controller;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Participante 2:'),
        Container(
          constraints:
              BoxConstraints(maxWidth: 200, maxHeight: 60, minHeight: 60),
          child: TextField(
            controller: _controller,
            onChanged: (String value) {
              gUsuario = value;
            },
            autofocus: false,
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                //borderSide: BorderSide(color: Colors.black)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                //borderSide: BorderSide(color: Colors.black)
              ),
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                //fontStyle: FontStyle.italic,
              ),
              fillColor: Colors.white,
              filled: true,
              //hintText: hintText,
              labelText: 'Usuario',
              //suffixIcon: Icon(icono1),
              //icon: Icon(icono2, color: Colors.white)),
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20),
        ),
      ],
    );
  }
}

class Ganador extends StatelessWidget {
  //late int i;
  @override
  Widget build(BuildContext context) {
    var _controller;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Ganador'),
        Container(
          constraints:
              BoxConstraints(maxWidth: 200, maxHeight: 60, minHeight: 60),
          child: TextField(
            readOnly: true,
            controller: _controller,
            onChanged: (String value) {
              gUsuario = value;
            },
            autofocus: false,
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.black)),
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                //fontStyle: FontStyle.italic,
              ),
              fillColor: Colors.white,
              filled: true,
              //hintText: hintText,
              labelText: '',
              //suffixIcon: Icon(icono1),
              //icon: Icon(icono2, color: Colors.white)),
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20),
        ),
      ],
    );
  }
}

class Ronda extends StatelessWidget {
  //late int i;
  @override
  Widget build(BuildContext context) {
    var _controller;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Ronda:'),
        Container(
          constraints:
              BoxConstraints(maxWidth: 200, maxHeight: 60, minHeight: 60),
          child: TextField(
            readOnly: true,
            controller: _controller,
            onChanged: (String value) {
              gUsuario = value;
            },
            autofocus: false,
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.black)),
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                //fontStyle: FontStyle.italic,
              ),
              fillColor: Colors.white,
              filled: true,
              //hintText: hintText,
              labelText: '',
              //suffixIcon: Icon(icono1),
              //icon: Icon(icono2, color: Colors.white)),
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20),
        ),
      ],
    );
  }
}

class Torneo extends StatelessWidget {
  //late int i;
  @override
  Widget build(BuildContext context) {
    var _controller;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Torneo'),
        Container(
          constraints:
              BoxConstraints(maxWidth: 200, maxHeight: 60, minHeight: 60),
          child: TextField(
            readOnly: true,
            controller: _controller,
            onChanged: (String value) {
              gUsuario = value;
            },
            autofocus: false,
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.black)),
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                //fontStyle: FontStyle.italic,
              ),
              fillColor: Colors.white,
              filled: true,
              //hintText: hintText,
              labelText: '',
              //suffixIcon: Icon(icono1),
              //icon: Icon(icono2, color: Colors.white)),
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20),
        ),
      ],
    );
  }
}

class BotonBuscarParticipante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: double.infinity, minHeight: 60.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: TextButton(
          child: Text(
            'Consultar',
            style: TextStyle(fontWeight: FontWeight.w600),
            textScaleFactor: 1.6,
          ),
          style: iconButtonStyle,
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          }),
    );
  }
}

final ButtonStyle iconButtonStyle = TextButton.styleFrom(
  //padding: EdgeInsets.only(right: 88.0, left: 87.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(100.0)),
  ),
  backgroundColor: Colors.blue,
  //Colors.green,
  primary: Colors.white,
  minimumSize: Size.fromRadius(20.0),
  elevation: 8.0,
  textStyle: TextStyle(fontWeight: FontWeight.w700),
);
