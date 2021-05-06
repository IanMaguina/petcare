import 'package:flutter/material.dart';
import 'package:petcare/src/pages/login_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[800],
      body: PageView(children: <Widget>[
        FlatButton(
            child: Text('Bienvenido'),
            textColor: Colors.white,
            onPressed: () {
              final route =
                  MaterialPageRoute(builder: (context) => LoginPage());

              Navigator.push(context, route);
            }),
      ]),
    );
  }
}
