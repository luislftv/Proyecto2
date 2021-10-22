import 'dart:convert';
import 'dart:developer';

import 'package:cliente2_soap_flutter/models/participante.dart';
import 'package:cliente2_soap_flutter/src/pages/adicionar_participante.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class Adicionar_participantes_provider {
  final _uri =
      Uri.parse("http://10.0.2.2:8080/ServidorSOAP/SWParticipante?wsdl");

  final _body =
      '''<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="http://ws/">
   <soapenv:Header/>
   <soapenv:Body>
      <ws:crearParticipante>
         <!--Optional:-->
         <arg0>$gUsuarioId</arg0>
         <!--Optional:-->
         <arg1>$gUsuarioApodo</arg1>
         <!--Optional:-->
         <arg2>2020-10-10</arg2>
         <!--Optional:-->
         <arg3>2020-10-10</arg3>
      </ws:crearParticipante>
   </soapenv:Body>
</soapenv:Envelope>''';

  Adicionar_participantes_provider() {
    this.adicionar();
  }

  Future<int> adicionar() async {
    final resp = await http.post(
      _uri,
      headers: {"Content-Type": "text/xml; charset=utf-8", "SOAPAction": ""},
      body: _body,
    );

    if (resp.statusCode == 200) {
      log('.l.');
    } else {
      log('Error: no se pudo conectar al ws');
      throw Exception("No se pudo conectar");
    }
  }
}
