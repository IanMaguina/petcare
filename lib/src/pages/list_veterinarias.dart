import 'package:flutter/material.dart';
import 'package:petcare/src/widgets/lista_veterinarias.dart';

class ListVeterinariesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final veterinaryService = Provider.of<VeterinaryService>(context);
    return Scaffold(
      body: SafeArea(top: true, child: ListVeterinaries()),
    );
  }
}
