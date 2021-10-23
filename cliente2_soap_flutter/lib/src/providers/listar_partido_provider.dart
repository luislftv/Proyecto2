import 'dart:convert';
import 'dart:developer';

import 'package:cliente2_soap_flutter/models/participante.dart';
import 'package:cliente2_soap_flutter/models/partido.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class listar_partidoss_provider {
  final _uri = Uri.parse("http://localhost:8080/ServidorSOAP/SWPartido?WSDL");

  final _body = '''
  <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="http://ws/">
   <soapenv:Header/>
   <soapenv:Body>
      <ws:listarTodosLosPartidos/>
   </soapenv:Body>
</soapenv:Envelope>''';

  listar_partidoss_provider() {
    this.getParticipantes();
  }

  Future<List<PartidoModel>> getParticipantes() async {
    final resp = await http.post(
      _uri,
      headers: {"Content-Type": "text/xml; charset=utf-8", "SOAPAction": ""},
      body: _body,
    );

    if (resp.statusCode == 200) {
      final Xml2Json xml2Json = Xml2Json();

      final responseBody = resp.body;

      xml2Json.parse(responseBody);

      final jsonString = xml2Json.toParker();

      final asd = jsonString.substring(62, jsonString.length - 3);

      final decodejson = jsonDecode(asd);

      List<dynamic> data = decodejson["return"];

      List<PartidoModel> respuesta =
          data.map((e) => new PartidoModel.fromJson(e)).toList();

      return respuesta;
    } else {
      log('Error: no se pudo conectar al ws');
      throw Exception("No se pudo conectar");
    }
  }
}
