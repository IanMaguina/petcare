import 'package:flutter/material.dart';

class AddVetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name;
    String lastname;
    String document;
    String email;
    String password;
    //String photo;
    String phone;
    String age;

    Widget _buildName(String value) {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Name'),
        validator: (value) {
          if (value.isEmpty) {
            return "Nombre es requerido";
          }
          return null;
        },
        onSaved: (String value) {
          name = value;
        },
      );
    }

    Widget _buildLastName(String value) {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Lastname'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Lastame is required';
          }
          return null;
        },
        onSaved: (String value) {
          lastname = value;
        },
      );
    }

    Widget _buildDocument(String value) {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Name'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Document is required';
          }
          return null;
        },
        onSaved: (String value) {
          document = value;
        },
      );
    }

    Widget _buildEmail(String value) {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Email is required';
          }
          return null;
        },
        onSaved: (String value) {
          email = value;
        },
      );
    }

    Widget _buildPassword(String value) {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Password'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Password is required';
          }
          return null;
        },
        onSaved: (String value) {
          password = value;
        },
      );
    }

    Widget _buildPhone(String value) {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Phone'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Phone is required';
          }
          return null;
        },
        onSaved: (String value) {
          phone = value;
        },
      );
    }

    Widget _buildAge(String value) {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Age'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Age is required';
          }
          return null;
        },
        onSaved: (String value) {
          phone = value;
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Registrar Veterinario',
        style: TextStyle(color: Colors.white),
      )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(name),
                _buildLastName(lastname),
                _buildDocument(document),
                _buildEmail(email),
                _buildPassword(password),
                _buildPhone(phone),
                _buildAge(age),
                SizedBox(height: 100),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    primary: Color.fromRGBO(57, 179, 179, 1.0),
                  ),
                  child: Text(
                    'Registrar ',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () => {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
