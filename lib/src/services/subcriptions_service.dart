import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/plan_subscription.dart';

final urlPetcare = "https://petcarefas.azurewebsites.net/api";

final apiKey = "";
final token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjkiLCJuYmYiOjE2MjA0NTIxOTgsImV4cCI6MTYyMTA1Njk5OCwiaWF0IjoxNjIwNDUyMTk4fQ.G-jOetqvYbgACErTLsF3iimKNKeHSZooUXX0YH8LXFI";

class PlanService with ChangeNotifier {
  List<PlanSubscription> plans = [];

  Future<List<Future>> getData() async {
    final url = '$urlPetcare/dashboard/subscriptionplans';
    final resp = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data;
    if (resp.statusCode == 200) {
      //var body = jsonDecode(resp.body);
      if (resp.body.isNotEmpty) {
        data = planSubscriptionFromJson(resp.body);
      }
      this.plans.addAll(data);
      notifyListeners();
    }
  }



  
}
