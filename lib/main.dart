import 'package:flutter/material.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';
import 'package:petcare/src/routes/routes.dart';
import 'package:petcare/src/services/pets_service.dart';
import 'package:petcare/src/services/service_service.dart';
import 'package:petcare/src/services/veterinary_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //agregado

  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ServicesService()),
        //ChangeNotifierProvider(create: (_) => PetsService()),
      ],
      child: MaterialApp(
          title: 'Petcare',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
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
