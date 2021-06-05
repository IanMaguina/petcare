import 'dart:convert';

List<MedicalHistory> medicalHistoryFromJson(String str) =>
    List<MedicalHistory>.from(
        json.decode(str).map((x) => MedicalHistory.fromJson(x)));

String medicalHistoryToJson(List<MedicalHistory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedicalHistory {
  MedicalHistory({
    this.id,
    this.description,
  });

  int id;
  String description;

  factory MedicalHistory.fromJson(Map<String, dynamic> json) => MedicalHistory(
        id: json["id"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
      };
}
