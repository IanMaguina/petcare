import 'package:flutter/material.dart';
import 'package:petcare/src/utils/utils.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[_fondo(context), _formulario(context)],
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
      padding: EdgeInsets.only(top: 80.0),
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
            child: Column(
              children: <Widget>[
                Text('Ingreso', style: TextStyle(fontSize: 20.0)),
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
                _botonLogin(),
              ],
            ),
          ),
          FlatButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'adduser'),
              child: Text('Crea una nueva cuenta Usuario')),
          SizedBox(height: 20.0),
          FlatButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'adduservet'),
              child: Text('Crea una nueva cuenta Veterinario')),
          SizedBox(height: 100.0),
        ],
      ),
    );
  }

  _emailUsuario() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
              hintText: 'ingrese el usuario',
              labelText: 'Usuario',
              // counterText: snapshot.data,
              // errorText: snapshot.error
            ),
          ),
        );
      },
    );
  }

  _passwordUsuario() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Colors.deepPurple),
                labelText: 'Contraseña',
                // counterText: snapshot.data,
                errorText: snapshot.error),
          ),
        );
      },
    );
  }
}

_botonLogin() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: () {
            // final route =
            //     MaterialPageRoute(builder: (context) => home());

            //Navigator.push(context, route);
            Navigator.pushReplacementNamed(context, 'home');
          });
    },
  );
}
