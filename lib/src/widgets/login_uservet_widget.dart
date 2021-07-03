import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petcare/src/pages/home_vet_page.dart';
import 'package:petcare/src/services/user_vet_service.dart';

class LoginVetWidget extends StatefulWidget {
  @override
  _LoginVetWidgetState createState() => _LoginVetWidgetState();
}

class _LoginVetWidgetState extends State<LoginVetWidget> {
  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String usuario;
  String password;

  UservService uvetService = new UservService();
  @override
  Widget build(BuildContext context) {
    usuario = "";
    password = "";
    return Container(
      child: _formulario(context),
    );
  }

  _formulario(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
              child: Container(
            height: 180.0,
          )),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Form(
              key: formkey,
              child: Column(
                children: <Widget>[
                  Text('Ingreso Veterinarios',
                      style: TextStyle(fontSize: 20.0)),
                  SizedBox(
                    height: 60.0,
                  ),
                  _emailUsuario(),
                  SizedBox(
                    height: 30.0,
                  ),
                  _passwordUsuario(),
                  SizedBox(
                    height: 30.0,
                  ),
                  _botonLogin(context),
                ],
              ),
            ),
          ),
          TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'adduservet'),
              child: Text('Crea una nueva cuenta Veterinario')),
          SizedBox(height: 100.0),
        ],
      ),
    );
  }

  _emailUsuario() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        initialValue: usuario,
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) => usuario = value.trim(),
        decoration: InputDecoration(
          icon: Icon(Icons.alternate_email,
              color: Color.fromRGBO(57, 179, 179, 1.0)),
          hintText: 'ingrese su email',
          labelText: 'Veterinario',
        ),
      ),
    );
  }

  _passwordUsuario() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        obscureText: true,
        initialValue: password,
        onSaved: (value) => password = value,
        decoration: InputDecoration(
          icon: Icon(Icons.lock_outline,
              color: Color.fromRGBO(57, 179, 179, 1.0)),
          labelText: 'Contraseña',
        ),
      ),
    );
  }

  _botonLogin(BuildContext context) {
    return ElevatedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text('Ingresar'),
        ),
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          elevation: 0.0,
          primary: Color.fromRGBO(57, 179, 179, 1.0),
          textStyle: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          _submit(context);
        });
  }

  void _submit(BuildContext context) async {
    if (!formkey.currentState.validate()) {
      return;
    }
    formkey.currentState.save();
    //final data = uservet;
    final result = await uvetService.loginvet(usuario, password);

    if (!result.error) {
      print(result);
      Fluttertoast.showToast(msg: "Bienvenido !");
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomeVetPage(),
      ));
    } else {
      Fluttertoast.showToast(msg: result.errorMessage);
    }
  }
}
