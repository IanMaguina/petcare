import 'package:flutter/material.dart';

class LoginVetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email,
                  color: Color.fromRGBO(57, 179, 179, 1.0)),
              hintText: 'ingrese su email',
              labelText: 'Veterinario',
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
                icon: Icon(Icons.lock_outline,
                    color: Color.fromRGBO(57, 179, 179, 1.0)),
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
      return ElevatedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 0.0,
            primary: Color.fromRGBO(57, 179, 179, 1.0),
            textStyle: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            // final route =
            //     MaterialPageRoute(builder: (context) => home());

            //Navigator.push(context, route);
            Navigator.pushNamed(context, 'home_vet');
          });
    },
  );
}
