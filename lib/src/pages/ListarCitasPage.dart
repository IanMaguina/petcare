import 'package:flutter/material.dart';
import 'package:petcare/src/widgets/CustomWidgets.dart';

class ListarCitasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ListarCita',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MySearchBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
