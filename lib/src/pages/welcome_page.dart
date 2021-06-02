import 'package:flutter/material.dart';
import 'package:petcare/src/pages/login_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(66, 118, 166, 1.0),
      body: PageView(children: <Widget>[
        ElevatedButton(
            child: Text('Bienvenido'),
            onPressed: () {
              final route =
                  MaterialPageRoute(builder: (context) => LoginPage());

              Navigator.push(context, route);
            }),
      ]),
    );
  }
}
