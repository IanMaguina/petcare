// To parse this JSON data, do
//
//     final headHistoryPet = headHistoryPetFromJson(jsonString);

import 'dart:convert';

HeadHistoryPet headHistoryPetFromJson(String str) =>
    HeadHistoryPet.fromJson(json.decode(str));

String headHistoryPetToJson(HeadHistoryPet data) => json.encode(data.toJson());

class HeadHistoryPet {
  HeadHistoryPet({
    this.createAt,
    this.description,
    this.type,
    this.action,
    this.idVeterinaria,
    this.idVetUser,
    this.idUser,
    this.idPet,
    this.idPetProfile,
  });

  DateTime createAt;
  String description;
  String type;
  String action;
  int idVeterinaria;
  int idVetUser;
  int idUser;
  int idPet;
  int idPetProfile;

  factory HeadHistoryPet.fromJson(Map<String, dynamic> json) => HeadHistoryPet(
        createAt: DateTime.parse(json["CreateAt"]),
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
        "CreateAt":
            "${createAt.year.toString().padLeft(4, '0')}-${createAt.month.toString().padLeft(2, '0')}-${createAt.day.toString().padLeft(2, '0')}",
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
