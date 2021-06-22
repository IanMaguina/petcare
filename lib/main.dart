import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';
import 'package:petcare/src/routes/routes.dart';
import 'package:petcare/src/services/service_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //agregado
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new ServicesService()),
        //ChangeNotifierProvider(create: (_) => PetsService()),
      ],
      child: MaterialApp(
          title: 'Petcare',
          debugShowCheckedModeBanner: false,
          initialRoute: 'test',
          routes: getApplicationRoutes(),
          theme: ThemeData(
              primaryColor: Color.fromRGBO(57, 179, 179, 1.0),
              /* appBarTheme: AppBarTheme(
                actionsIconTheme: IconThemeData(color: Colors.white),
                titleTextStyle: TextStyle(color: Colors.white),
              ), */
/*               bottomAppBarColor: Color.fromRGBO(57, 179, 179, 0.3), */
              textTheme: TextTheme(
                  //subtitle1: TextStyle(color: Colors.white),
                  button: TextStyle(color: Colors.white)))),
    );
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
