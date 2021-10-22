import 'dart:convert';
import 'dart:developer';

import 'package:cliente2_soap_flutter/models/participante.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class listar_participantes_provider {
  final _uri =
      Uri.parse("http://10.0.2.2:8080/ServidorSOAP/SWParticipante?wsdl");

  final _body = '''
  <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="http://ws/">
   <soapenv:Header/>
   <soapenv:Body>
      <ws:listarParticipantes/>
   </soapenv:Body>
</soapenv:Envelope>''';

  listar_participantes_provider() {
    this.getParticipantes();
  }

  Future<List<ParticipanteModel>> getParticipantes() async {
    final resp = await http.post(
      _uri,
      headers: {"Content-Type": "text/xml; charset=utf-8", "SOAPAction": ""},
      body: _body,
    );

    if (resp.statusCode == 200) {
      final responseBody = resp.body;

      final parseXml = xml.XmlDocument.parse(responseBody).innerXml;

      final decodejson = jsonDecode(parseXml) as List;

      List<ParticipanteModel> data =
          decodejson.map((e) => ParticipanteModel.fromJson(e)).toList();

      return data;
    } else {
      log('Error: no se pudo conectar al ws');
      throw Exception("No se pudo conectar");
    }
  }
}
