import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'baño': Icons.bathtub,
  'cita': Icons.airline_seat_flat_angled,
  'articulos': Icons.add_business_rounded,
  'guarderia': Icons.all_inbox_sharp,
  'dental': Icons.bakery_dining,
  'cultivo': Icons.biotech,
  'vaccine': Icons.colorize,
  'pets': Icons.pets,
  'date': Icons.date_range,
  'advices': Icons.phone_in_talk,
};

Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono], color: Color.fromRGBO(57, 179, 179, 1.0));
}
