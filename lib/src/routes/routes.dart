import 'package:flutter/material.dart';
import 'package:petcare/src/pages/add_user_page.dart';
import 'package:petcare/src/pages/add_user_vet_page.dart';
import 'package:petcare/src/pages/login_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    'adduser': (BuildContext context) => AddUserPage(),
    'adduservet': (BuildContext context) => AddUserVetPage(),
  };
}
