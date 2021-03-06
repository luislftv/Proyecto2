import 'dart:ui';
import 'package:cliente2_soap_flutter/src/providers/Adicionar_participante_provider.dart';
import 'package:flutter/material.dart';

DateTime fecha;
DateTime fecha1;
DateTime ayer = DateTime.now().subtract(const Duration(days: 1));
String gUsuarioApodo;
String gUsuarioId;
DateTime gFechaInscripcion;
DateTime gFechaCaducidad;

class AdicionarParticipante extends StatefulWidget {
  AdicionarParticipante({Key key}) : super(key: key);

  @override
  _AdicionarParticipanteState createState() => _AdicionarParticipanteState();
}

class _AdicionarParticipanteState extends State<AdicionarParticipante> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Adicionar Participante',
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.top),
            child: Container(
              color: Colors.blueGrey[100],
              constraints: BoxConstraints(maxHeight: 750),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  IdParticipante(),
                  ApodoParticipante(),
                  lecturaFechaIngreso(context),
                  lecturaFechaExpiracion(context),
                  Expanded(child: SizedBox()),
                  BotonAdicionarParticipante()
                ],
              ),
            ),
          ),
        ));
  }

  Widget lecturaFechaIngreso(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Fecha de Ingreso:'),
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
                  '$fecha1',
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
                  firstDate: DateTime(2000, 01, 01),
                  lastDate: DateTime(2030, 12, 31),
                  useRootNavigator: false,
                );

                if (fecha1 == 'null') {
                  fecha1 = DateTime.now();
                }

                setState(() {});
                print(fecha1);
              }),
          margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20),
        ),
      ],
    );
  }

  Widget lecturaFechaExpiracion(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Fecha de Expiraci??n:'),
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
                fecha = await showDatePicker(
                  locale: const Locale('es', 'ES'),
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000, 01, 01),
                  lastDate: DateTime(2030, 12, 31),
                  useRootNavigator: false,
                );
                //fecha1 = fecha1.toString();
                if (fecha == 'null') {
                  fecha = DateTime.now();
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

class IdParticipante extends StatelessWidget {
  //late int i;
  @override
  Widget build(BuildContext context) {
    var _controller;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Id:'),
        Container(
          constraints:
              BoxConstraints(maxWidth: 200, maxHeight: 60, minHeight: 60),
          child: TextField(
            controller: _controller,
            onChanged: (String value) {
              gUsuarioId = value;
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

class ApodoParticipante extends StatelessWidget {
  //late int i;
  @override
  Widget build(BuildContext context) {
    var _controller;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Apodo:'),
        Container(
          constraints:
              BoxConstraints(maxWidth: 200, maxHeight: 60, minHeight: 60),
          child: TextField(
            controller: _controller,
            onChanged: (String value) {
              gUsuarioApodo = value;
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

class BotonAdicionarParticipante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final uiProvider = Provider.of<UiProviders>(context);

    //final currentIndex = uiProvider.estadoDeBusqueda;
    //switch (currentIndex) {
    //case 0:
    //if (gUsuario.length > 1 && gPass.length > 1) {
    return Container(
      constraints: BoxConstraints(minWidth: double.infinity, minHeight: 60.0),
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      //color: Colors.red,

      child: TextButton(
          //child: Container(
          child: Text(
            'Adicionar',
            style: TextStyle(fontWeight: FontWeight.w600),
            textScaleFactor: 1.6,
          ),
          //),
          style: iconButtonStyle,
          onPressed: () async {
            await Adicionar_participantes_provider();

            //if (gNombre.length > 1) {*/
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            //}
          } /*on Exception catch (e) {
                  _credencialesIncorrectas(context);
                  //rethrow;
                }
                /* if (usuario == gNombre && pass == gApellido) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'registro', (route) => false);
                } else {
                  
                }*/
              },
            ),
          );
        } else {
          return Container(
            constraints:
                BoxConstraints(minWidth: double.infinity, minHeight: 60.0),
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: TextButton(
              //child: Container(
              child: Text(
                'Confirmar',
                style: TextStyle(fontWeight: FontWeight.w600),
                textScaleFactor: 1.6,
              ),
              //),
              style: inactivo,
              onPressed: () {},
            ),
          );
        }
    }
    return Container(
      constraints: BoxConstraints(minWidth: double.infinity, minHeight: 60.0),
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: TextButton(
        //child: Container(
        child: Text(
          'Confirmar',
          style: TextStyle(fontWeight: FontWeight.w600),
          textScaleFactor: 1.6,
        ),
        //),
        style: inactivo,
        onPressed: () {
          //setState(() {
          //Navigator.pushNamed(context, 'buscando');
        },*/
          ),
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
