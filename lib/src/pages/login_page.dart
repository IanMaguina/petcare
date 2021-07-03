import 'package:flutter/material.dart';
import 'package:petcare/src/pages/user_vet_perfil_page.dart';
import 'package:petcare/src/widgets/login_user_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _fondo(context),
            UserVetInfoPage("1"),
          ],
        ),
      ),
    );
  }

  Widget _fondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoPrint = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(57, 179, 179, 1.0),
        Color.fromRGBO(66, 118, 166, 1.0),
      ])),
    );

    final texto = Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Icon(Icons.pets, color: Colors.white, size: 100.0),
          SizedBox(height: 10.0, width: double.infinity),
          Text('Pet Care',
              style: TextStyle(color: Colors.white, fontSize: 25.0))
        ],
      ),
    );
    return Stack(
      children: <Widget>[fondoPrint, texto],
    );
  }
}
