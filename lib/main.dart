import 'package:flutter/material.dart';
import 'package:petcare/src/pages/home_page.dart';
import 'package:petcare/src/widgets/custom_bottom_nav.dart';

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
        body: HomePage(),
        bottomNavigationBar: CustomBottomNavigation(),
      ),
    );
  }
}
