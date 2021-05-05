import 'package:flutter/material.dart';
import 'package:petcare/src/pages/login_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(children: <Widget>[
        Text('Bienvenido '),
        IconButton(
          icon: Icon(Icons.pets),
          onPressed: () {
            final route = MaterialPageRoute(builder: (context) => LoginPage());

            Navigator.push(context, route);
          },
        ),
      ]),
    );
  }
}
