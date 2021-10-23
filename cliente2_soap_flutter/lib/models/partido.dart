// To parse this JSON data, do
//
//     final partidoModel = partidoModelFromJson(jsonString);

import 'dart:convert';

List<PartidoModel> partidoModelFromJson(String str) => List<PartidoModel>.from(
    json.decode(str).map((x) => PartidoModel.fromJson(x)));

String partidoModelToJson(List<PartidoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PartidoModel {
  PartidoModel({
    this.mesa,
    this.par1,
    this.par2,
    this.ganador,
    this.ronda,
    this.fechaProgramada,
    this.horaInicio,
    this.horaFin,
    this.torneo,
  });

  int mesa;
  int par1;
  int par2;
  int ganador;
  int ronda;
  DateTime fechaProgramada;
  DateTime horaInicio;
  DateTime horaFin;
  String torneo;

  factory PartidoModel.fromJson(Map<String, dynamic> json) => PartidoModel(
        mesa: json["mesa"],
        par1: json["par1"],
        par2: json["par2"],
        ganador: json["ganador"],
        ronda: json["ronda"],
        fechaProgramada: DateTime.parse(json["fechaProgramada"]),
        horaInicio: DateTime.parse(json["horaInicio"]),
        horaFin: DateTime.parse(json["horaFin"]),
        torneo: json["torneo"],
      );

  Map<String, dynamic> toJson() => {
        "mesa": mesa,
        "par1": par1,
        "par2": par2,
        "ganador": ganador,
        "ronda": ronda,
        "fechaProgramada": fechaProgramada,
        "horaInicio": horaInicio,
        "horaFin": horaFin,
        "torneo": torneo,
      };
}
