import 'package:flutter/material.dart';
import 'package:petcare/src/widgets/login_uservet_widget.dart';

class LoginVetPage extends StatefulWidget {
  @override
  _LoginVetPageState createState() => _LoginVetPageState();
}

class _LoginVetPageState extends State<LoginVetPage> {
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
            LoginVetWidget(),
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
