import 'package:flutter/material.dart';
import 'package:petcare/src/bloc/login_bloc.dart';
import 'package:petcare/src/bloc/provider.dart';
import 'package:petcare/src/providers/usuario_provider.dart';
import 'package:petcare/src/utils/utils.dart';

class LoginUserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _formulario(context),
    );
  }

  _formulario(BuildContext context) {
    // final bloc = (Provider.of(context) == null) ? '' : Provider.of(context);
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
/*                 _emailUsuario(bloc), */
                _emailUsuario(),
                SizedBox(
                  height: 30.0,
                ),
                /* _passwordUsuario(bloc), */
                _passwordUsuario(),
                SizedBox(
                  height: 30.0,
                ),
                /* _botonLogin(bloc), */
                _botonLogin(),
              ],
            ),
          ),
          TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'adduser'),
              child: Text('Crea una nueva cuenta Usuario')),
          SizedBox(height: 100.0),
        ],
      ),
    );
  }

  /* _emailUsuario(LoginBloc bloc) { */
  _emailUsuario() {
    return StreamBuilder(
      // stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email,
                  color: Color.fromRGBO(57, 179, 179, 1.0)),
              hintText: 'ingrese su email',
              labelText: 'Usuario',
              //counterText: snapshot.data,
              // errorText: snapshot.error
            ),
            //onChanged: bloc.changeEmail
          ),
        );
      },
    );
  }

  _passwordUsuario() {
    return StreamBuilder(
      // stream: bloc.passwordStream,
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
            // onChanged: bloc.changePassword
          ),
        );
      },
    );
  }
}

_botonLogin() {
  return StreamBuilder(
    //stream: bloc.formValidStream,
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
          onPressed: () {}
          /* 
          snapshot.hasData ? () => _login(bloc, context) : null */

          );
    },
  );
}

/* _login(LoginBloc bloc, BuildContext context) async {
  Map info = await UsuarioProvider().login(bloc.email, bloc.password);

  if (info['ok']) {
    Navigator.pushReplacementNamed(context, 'home');
  } else {
    mostrarAlerta(context, info['mensaje']);
  }
  // Navigator.pushReplacementNamed(context, 'home');
} */
