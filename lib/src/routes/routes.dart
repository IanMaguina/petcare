import 'package:flutter/material.dart';
import 'package:petcare/src/pages/List_pets.dart';
//import 'package:petcare/src/pages/listPet_page.dart';
import 'package:petcare/src/pages/add_user_page.dart';
import 'package:petcare/src/pages/add_user_vet_page.dart';
import 'package:petcare/src/pages/home_page.dart';
import 'package:petcare/src/pages/home_vet_page.dart';
import 'package:petcare/src/pages/list_veterinarias.dart';
import 'package:petcare/src/pages/login_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    'home': (BuildContext context) => HomePage(),
    'home_vet': (BuildContext context) => HomeVetPage(),
    'adduser': (BuildContext context) => AddUserPage(),
    'adduservet': (BuildContext context) => Add_Vet(),
    'vetplaces': (BuildContext context) => ListVeterinariesPage(),
    PetListScreen.routeName: (ctx) => PetListScreen(),
  };
}
