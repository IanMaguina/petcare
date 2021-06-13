// To parse this JSON data, do
//
//     final historyItem = historyItemFromJson(jsonString);

import 'dart:convert';

HistoryItem historyItemFromJson(String str) =>
    HistoryItem.fromJson(json.decode(str));

String historyItemToJson(HistoryItem data) => json.encode(data.toJson());

class HistoryItem {
  HistoryItem({
    this.id,
    this.dateTime,
    this.description,
    this.type,
    this.action,
    this.idVeterinaria,
    this.idVetUser,
    this.idUser,
    this.idPet,
    this.idPetProfile,
  });

  int id;
  DateTime dateTime;
  String description;
  String type;
  String action;
  int idVeterinaria;
  int idVetUser;
  int idUser;
  int idPet;
  int idPetProfile;

  factory HistoryItem.fromJson(Map<String, dynamic> json) => HistoryItem(
        id: json["id"],
        dateTime: DateTime.parse(json["dateTime"]),
        description: json["description"],
        type: json["type"],
        action: json["action"],
        idVeterinaria: json["id_veterinaria"],
        idVetUser: json["id_vet_user"],
        idUser: json["id_user"],
        idPet: json["id_pet"],
        idPetProfile: json["id_pet_profile"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateTime": dateTime.toIso8601String(),
        "description": description,
        "type": type,
        "action": action,
        "id_veterinaria": idVeterinaria,
        "id_vet_user": idVetUser,
        "id_user": idUser,
        "id_pet": idPet,
        "id_pet_profile": idPetProfile,
      };
}
