//
//     final Date = DateFromJson(jsonString);

import 'dart:convert';

import 'dart:ffi';

//Date DateFromJson(String str) => Date.fromJson(json.decode(str));
Date DateFromJson(String str) => Date.fromJson(json.decode(str));

String DateToJson(Date data) => json.encode(data.toJson());

class Date {
  Date({
    this.id,
    this.date_reservation,
    this.total_price,
    this.star_time,
    this.end_time,
    this.customer_id,
    this.service_id,
    this.serviceProvider_id,
    this.pet_id,
  });

  int id;
  Date date_reservation;
  Double total_price;
  int star_time;
  int end_time;
  int customer_id;
  int service_id;
  int serviceProvider_id;
  int pet_id;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        id: json["id"],
        date_reservation: json["date_reservation"],
        total_price: json["total_price"],
        star_time: json["star_time"],
        end_time: json["end_time"],
        customer_id: json["customer_id"],
        service_id: json["service_id"],
        serviceProvider_id: json["serviceProvider_id"],
        pet_id: json["pet_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_reservation": date_reservation,
        "total_price": total_price,
        "star_time": star_time,
        "end_time": end_time,
        "customer_id": customer_id,
        "service_id": service_id,
        "serviceProvider_id": serviceProvider_id,
        "pet_id": pet_id,
      };
}
