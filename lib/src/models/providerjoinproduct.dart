// To parse this JSON data, do
//
//     final Providerjoinproduct = uservetFromJson(jsonString);

import 'dart:convert';

Providerjoinproduct providerjoinproductFromJson(String str) => Providerjoinproduct.fromJson(json.decode(str));

String providerjoinproductToJson(Providerjoinproduct data) => json.encode(data.toJson());

class Providerjoinproduct {
  Providerjoinproduct(
      {
        this.id,
        this.providerId,
        this.typeProductId

      });

  Providerjoinproduct.c(int id, int providerId, int typeProductId)
      {
        this.id=id;
        this.providerId=providerId;
        this.typeProductId=typeProductId;

      }
  int id;
  int providerId;
  int typeProductId;

  factory Providerjoinproduct.fromJson(Map<String, dynamic> json) {
    return Providerjoinproduct(
      id: json["id"],
      providerId: json["providerId"],
      typeProductId: json["typeProductId"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "typeProductId":typeProductId,
      "providerId":providerId

    };
  }
}
