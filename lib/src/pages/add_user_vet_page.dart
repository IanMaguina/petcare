import 'package:flutter/material.dart';

class AddVetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name;
    String lastname;
    String document;
    String email;
    String password;
    String photo;
    String phone;
    String age;

    Widget _buildName() {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Name'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is required';
          }
        },
        onSaved: (String value) {
          name = value;
        },
      );
    }

    Widget _buildLastName() {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Lastname'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Lastame is required';
          }
        },
        onSaved: (String value) {
          lastname = value;
        },
      );
    }

    Widget _buildDocument() {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Name'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Document is required';
          }
        },
        onSaved: (String value) {
          document = value;
        },
      );
    }

    Widget _buildEmail() {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Email is required';
          }
        },
        onSaved: (String value) {
          email = value;
        },
      );
    }

    Widget _buildPassword() {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Password'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Password is required';
          }
        },
        onSaved: (String value) {
          password = value;
        },
      );
    }

    Widget _buildPhone() {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Phone'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Phone is required';
          }
        },
        onSaved: (String value) {
          phone = value;
        },
      );
    }

    Widget _buildAge() {
      return TextFormField(
        decoration: InputDecoration(labelText: 'Age'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Age is required';
          }
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
                _buildName(),
                _buildLastName(),
                _buildDocument(),
                _buildEmail(),
                _buildPassword(),
                _buildPhone(),
                _buildAge(),
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
