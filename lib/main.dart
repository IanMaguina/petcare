import 'package:flutter/material.dart';
import 'package:petcare/src/pages/list_veterinarias';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Petcare'),
          ),
          body:List_Veterinarias()),
    );
  }
}
