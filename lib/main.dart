import 'package:flutter/material.dart';
import 'package:petcare/src/routes/routes.dart';
import 'package:petcare/src/services/pets_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PetsService())],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: getApplicationRoutes(),
        /*  theme: ThemeData(primaryColor: Colors.teal[400]
          ) */
      ),
    );
  }
}
