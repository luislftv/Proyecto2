import 'dart:convert';
import 'dart:developer';

import 'package:cliente2_soap_flutter/models/participante.dart';
import 'package:cliente2_soap_flutter/src/pages/adicionar_participante.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class Adicionar_participantes_provider {
  final _uri =
      Uri.parse("http://10.0.2.2:8080/ServidorSOAP/SWParticipante?wsdl");

  Adicionar_participantes_provider() {
    this.adicionar();
  }

  // ignore: missing_return
  Future adicionar() async {
    final id = gUsuarioId;
    final apodo = gUsuarioApodo;

    String f1 = fecha1.year.toString() +
        "-" +
        fecha1.month.toString() +
        "-" +
        fecha1.day.toString();

    String f2 = fecha.year.toString() +
        "-" +
        fecha.month.toString() +
        "-" +
        fecha.day.toString();

    final _body =
        '''<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="http://ws/">
              <soapenv:Header/>
              <soapenv:Body>
                  <ws:crearParticipante>
                    <!--Optional:-->
                    <arg0>$id</arg0>
                    <!--Optional:-->
                    <arg1>$apodo</arg1>
                    <!--Optional:-->
                    <arg2>$f1</arg2>
                    <!--Optional:-->
                    <arg3>$f2</arg3>
                  </ws:crearParticipante>
              </soapenv:Body>
            </soapenv:Envelope>''';

    final resp = await http.post(
      _uri,
      headers: {"Content-Type": "text/xml; charset=utf-8"},
      body: _body,
    );

    if (resp.statusCode == 200) {
      return resp;
      // log('.l.');
    } else {
      log('Error: no se pudo conectar al ws');
      throw Exception("No se pudo conectar");
    }
  }
}
