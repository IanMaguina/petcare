// To parse this JSON data, do
//
//     final planSubscription = planSubscriptionFromJson(jsonString);

import 'dart:convert';

PlanSubscription planSubscriptionFromJson(String str) =>
    PlanSubscription.fromJson(json.decode(str));

String planSubscriptionToJson(PlanSubscription data) =>
    json.encode(data.toJson());

class PlanSubscription {
  PlanSubscription({
    this.id,
    this.name,
    this.description,
    this.price,
    this.duration,
  });

  int id;
  String name;
  String description;
  double price;
  int duration;

  factory PlanSubscription.fromJson(Map<String, dynamic> json) =>
      PlanSubscription(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"].toDouble(),
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "duration": duration,
      };
}
