import 'package:flutter/material.dart';

import 'package:petcare/src/services/veterinary_service.dart';
import 'package:petcare/src/widgets/lista_veterinarias.dart';
import 'package:provider/provider.dart';

class ListVeterinariesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final veterinaryService = Provider.of<VeterinaryService>(context);
    return Scaffold(
      body: ListVeterinaries(veterinaryService.veterinarias),
    );
  }
}
