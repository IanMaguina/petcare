import 'package:flutter/material.dart';
import 'package:petcare/src/pages/login_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[600],
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
