import 'package:flutter/material.dart';
import 'package:petcare/src/pages/List_pets.dart';
//import 'package:petcare/src/pages/listPet_page.dart';
import 'package:petcare/src/pages/add_user_page.dart';
import 'package:petcare/src/pages/add_user_vet_page.dart';
import 'package:petcare/src/pages/home_page.dart';
import 'package:petcare/src/pages/welcome_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => WelcomePage(),
    'home': (BuildContext context) => HomePage(),
    'adduser': (BuildContext context) => AddUserPage(),
    'adduservet': (BuildContext context) => AddVetPage(),
    PetListScreen.routeName: (ctx) => PetListScreen(),
  };
}
