// To parse  this JSON data, do
//
//     final appointment = appointmentFromJson(jsonString);

import 'dart:convert';

Appointment appointmentFromJson(String str) =>
    Appointment.fromJson(json.decode(str));

String appointmentToJson(Appointment data) => json.encode(data.toJson());

class Appointment {
  Appointment({
     this.datereservation,
     this.starttime,
     this.endtime,
     this.idUser,
     this.idPet,
     this.idVeterinaria,
     this.idTipoServicio,
     this.idServicio,
  });

  DateTime datereservation;
  String starttime;
  String endtime;
  int idUser;
  int idPet;
  int idVeterinaria;
  int idTipoServicio;
  int idServicio;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        datereservation: DateTime.parse(json["datereservation"]),
        starttime: json["starttime"],
        endtime: json["endtime"],
        idUser: json["id_user"],
        idPet: json["id_pet"],
        idVeterinaria: json["id_veterinaria"],
        idTipoServicio: json["id_tipo_servicio"],
        idServicio: json["id_servicio"],
      );

  Map<String, dynamic> toJson() => {
        "datereservation":
            "${datereservation.year.toString().padLeft(4, '0')}-${datereservation.month.toString().padLeft(2, '0')}-${datereservation.day.toString().padLeft(2, '0')}",
        "starttime": starttime,
        "endtime": endtime,
        "id_user": idUser,
        "id_pet": idPet,
        "id_veterinaria": idVeterinaria,
        "id_tipo_servicio": idTipoServicio,
        "id_servicio": idServicio,
      };
}
