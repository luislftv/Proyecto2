// To parse this JSON data, do
//
//     final participanteModel = participanteModelFromJson(jsonString);

import 'dart:convert';

List<ParticipanteModel> participanteModelFromJson(String str) =>
    List<ParticipanteModel>.from(
        json.decode(str).map((x) => ParticipanteModel.fromJson(x)));

String participanteModelToJson(List<ParticipanteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ParticipanteModel {
  ParticipanteModel({
    this.id,
    this.apodo,
    this.fechaInscripcion,
    this.fechaCaducidad,
  });

  int id;
  String apodo;
  DateTime fechaInscripcion;
  DateTime fechaCaducidad;

  factory ParticipanteModel.fromJson(Map<String, dynamic> json) =>
      ParticipanteModel(
        id: int.parse(json["id"]),
        apodo: json["apodo"],
        fechaInscripcion: DateTime.parse(json["fechaInscripcion"]),
        fechaCaducidad: DateTime.parse(json["fechaCaducidad"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "apodo": apodo,
        "fechaInscripcion":
            "${fechaInscripcion.year.toString().padLeft(4, '0')}-${fechaInscripcion.month.toString().padLeft(2, '0')}-${fechaInscripcion.day.toString().padLeft(2, '0')}",
        "fechaCaducidad":
            "${fechaCaducidad.year.toString().padLeft(4, '0')}-${fechaCaducidad.month.toString().padLeft(2, '0')}-${fechaCaducidad.day.toString().padLeft(2, '0')}",
      };
}
