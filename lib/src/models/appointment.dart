// To parse this JSON data, do
//
//     final appointment = appointmentFromJson(jsonString);

import 'dart:convert';

Appointment appointmentFromJson(String str) =>
    Appointment.fromJson(json.decode(str));

String appointmentToJson(Appointment data) => json.encode(data.toJson());

class Appointment {
  Appointment({
    this.id,
    this.endTime,
    this.providerId,
    this.productTypeId,
    this.petId,
    this.personProfileId,
    this.productId,
    this.veterinaryName,
    this.productName,
    this.petName,
    this.dateReservation,
    this.startTime,
    this.status,
    this.personName,
    this.productTypeName,
  });

  int id;
  String endTime;
  int providerId;
  int productTypeId;
  int petId;
  int personProfileId;
  int productId;
  String veterinaryName;
  String productName;
  String petName;
  String dateReservation;
  String startTime;
  int status;
  String personName;
  String productTypeName;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json["id"],
        endTime: json["endTime"],
        providerId: json["providerId"],
        productTypeId: json["productTypeId"],
        productTypeName: json["productTypeName"],
        petId: json["petId"],
        personProfileId: json["personProfileId"],
        productId: json["productId"],
        veterinaryName: json["veterinaryName"],
        productName: json["productName"],
        petName: json["petName"],
        dateReservation: json["dateReservation"],
        startTime: json["startTime"],
        status: json["status"],
        personName: json["personName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "endTime": endTime,
        "providerId": providerId,
        "productTypeId": productTypeId,
        "productTypeName": productTypeName,
        "petId": petId,
        "personProfileId": personProfileId,
        "productId": productId,
        "veterinaryName": veterinaryName,
        "productName": productName,
        "petName": petName,
        "dateReservation": dateReservation,
        "startTime": startTime,
        "status": status,
        "personName": personName,
      };
}
