import 'package:cliente2_soap_flutter/src/pages/actualizar_partido.dart';
import 'package:cliente2_soap_flutter/src/pages/adicionar_partido.dart';
import 'package:cliente2_soap_flutter/src/pages/consultar_partido.dart';
import 'package:cliente2_soap_flutter/src/pages/eliminar_partido.dart';
import 'package:cliente2_soap_flutter/src/pages/listar_participante.dart';
import 'package:cliente2_soap_flutter/src/pages/actualizar_participante.dart';
import 'package:cliente2_soap_flutter/src/pages/consultar_participante.dart';
import 'package:cliente2_soap_flutter/src/pages/listview_page.dart';
import 'package:cliente2_soap_flutter/src/pages/grafico.dart';
import 'package:flutter/material.dart';

import 'package:cliente2_soap_flutter/src/pages/adicionar_participante.dart';
import 'package:cliente2_soap_flutter/src/pages/eliminar_participante.dart';
import 'package:cliente2_soap_flutter/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'Adicionar': (BuildContext context) => AdicionarParticipante(),
    'AdicionarP': (BuildContext context) => AdicionarPartido(),
    'Eliminar': (BuildContext context) => EliminarParticipante(),
    'EliminarP': (BuildContext context) => EliminarPartido(),
    'Actualizar': (BuildContext context) => ActualizarParticipante(),
    'ActualizarP': (BuildContext context) => ActualizarPartido(),
    'Listar': (BuildContext context) => ListarParticipantes(),
    'Consultar': (BuildContext context) => ConsultarParticipante(),
    'ConsultarP': (BuildContext context) => ConsultarPartido(),
    'Gráfico': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListaPage()
  };
}
