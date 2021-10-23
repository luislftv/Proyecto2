import 'dart:ffi';
import 'package:cliente2_soap_flutter/models/partido.dart';
import 'package:cliente2_soap_flutter/src/providers/listar_partido_provider.dart';
import 'package:flutter/material.dart';

class ListarPartidos extends StatefulWidget {
  @override
  _ListarPartidos createState() => _ListarPartidos();
}

class _ListarPartidos extends State<ListarPartidos> {
  final partidoProvider = listar_partidoss_provider();

  Future<List<PartidoModel>> mapa;

  @override
  Void initState() {
    mapa = partidoProvider.getParticipantes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listar Partido'),
      ),
      body: Center(
        child: FutureBuilder(
            future: mapa,
            builder: (BuildContext context,
                AsyncSnapshot<List<PartidoModel>> snapshot) {
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
                          Text('mesa: ${data[index].mesa}'),
                          Text('par1: ${data[index].par1}'),
                          Text('par2: ${data[index].par2}'),
                          Text('ganador: ${data[index].ganador}'),
                          Text('ronda: ${data[index].ronda}'),
                          Text(
                              'fechaProgramada: ${data[index].fechaProgramada}'),
                          Text('horaInicio${data[index].horaInicio}'),
                          Text('horaFin${data[index].horaInicio}'),
                          Text('torneo: ${data[index].torneo}'),
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
