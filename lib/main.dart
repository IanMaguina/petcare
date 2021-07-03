import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';
import 'package:petcare/src/routes/routes.dart';
import 'package:petcare/src/services/pets_service.dart';
import 'package:petcare/src/services/region_service.dart';
import 'package:petcare/src/services/service_service.dart';
import 'package:petcare/src/services/user_vet_service.dart';
import 'package:petcare/src/services/vet_service.dart';

import 'package:provider/provider.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => UservService());
  GetIt.I.registerLazySingleton(() => VetService());
  GetIt.I.registerLazySingleton(() => RegionService());
  GetIt.I.registerLazySingleton(() => ServicesService());
  // GetIt.I.registerLazySingleton(() => PetsService());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //agregado
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  setupLocator();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Petcare',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: getApplicationRoutes(),
        theme: ThemeData(
            primaryColor: Color.fromRGBO(57, 179, 179, 1.0),
            textTheme: TextTheme(button: TextStyle(color: Colors.white))));
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
