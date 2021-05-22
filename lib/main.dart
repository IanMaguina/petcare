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
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: getApplicationRoutes(),
        theme: ThemeData(primaryColor: Colors.teal[700]));
  }
}
/* class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (_) => PetsService()),
        ChangeNotifierProvider(create: (_) => VeterinaryService()),
        ChangeNotifierProvider(create: (_) => ServicesService()),
        ChangeNotifierProvider(create: (_) => PetsService()), 
      ],
      child: MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: getApplicationRoutes(),
          theme: ThemeData(primaryColor: Colors.teal[700])),
    );
  }
} */
