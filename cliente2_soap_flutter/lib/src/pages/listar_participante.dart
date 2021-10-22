import 'dart:ffi';

import 'package:cliente2_soap_flutter/models/participante.dart';
import 'package:cliente2_soap_flutter/src/providers/listar_participantes_provider.dart';
import 'package:flutter/material.dart';

class ListarParticipantes extends StatefulWidget {
  @override
  _ListarParticipantes createState() => _ListarParticipantes();
}

class _ListarParticipantes extends State<ListarParticipantes> {
  final participanteProvider = listar_participantes_provider();

  Future<List<ParticipanteModel>> mapa;

  @override
  Void initState() {
    mapa = participanteProvider.getParticipantes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listar Participantes'),
      ),
      body: Center(
        child: FutureBuilder(
            future: mapa,
            builder: (BuildContext context,
                AsyncSnapshot<List<ParticipanteModel>> snapshot) {
              if (!snapshot.hasData) {
                return Container(
                  child: CircularProgressIndicator(),
                );
              } else {
                final data = snapshot.data;
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Text('id: ${data[index].id}'),
                          Text('apodo: ${data[index].apodo}'),
                          Text(
                              'fechaInscripcion: ${data[index].fechaInscripcion}'),
                          Text('fechaCaducidad${data[index].fechaCaducidad}'),
                          Divider(),
                        ],
                      );
                    });
              }
            }),
      ),
    );
  }
}
