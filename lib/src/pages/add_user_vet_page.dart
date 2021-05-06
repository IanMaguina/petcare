import 'package:flutter/material.dart';


class Add_Vet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String name;
    String lastname;
    String document;
    String email;
    String password;
    String photo;
    String phone;
    String age;


    Widget _buildName(){
      return TextFormField(
        decoration: InputDecoration(labelText:'Name'),
        validator: (String value){
          if(value.isEmpty){
            return 'Name is required';
          }
        },
        onSaved: (String value){
          name=value;
        },
      );
    }
    Widget _buildLastName(){
      return TextFormField(
        decoration: InputDecoration(labelText:'Lastname'),
        validator: (String value){
          if(value.isEmpty){
            return 'Lastame is required';
          }
        },
        onSaved: (String value){
          lastname=value;
        },
      );
    }
    Widget _buildDocument(){
      return TextFormField(
        decoration: InputDecoration(labelText:'Name'),
        validator: (String value){
          if(value.isEmpty){
            return 'Document is required';
          }
        },
        onSaved: (String value){
          document=value;
        },
      );
    }
    Widget _buildEmail(){
      return TextFormField(
        decoration: InputDecoration(labelText:'Email'),
        validator: (String value){
          if(value.isEmpty){
            return 'Email is required';
          }
        },
        onSaved: (String value){
          email=value;
        },
      );
    }
    Widget _buildPassword(){
      return TextFormField(
        decoration: InputDecoration(labelText:'Password'),
        validator: (String value){
          if(value.isEmpty){
            return 'Password is required';
          }
        },
        onSaved: (String value){
          password=value;
        },
      );
    }
    Widget _buildPhone(){
      return TextFormField(
        decoration: InputDecoration(labelText:'Phone'),
        validator: (String value){
          if(value.isEmpty){
            return 'Phone is required';
          }
        },
        onSaved: (String value){
          phone=value;
        },
      );
    }

    Widget _buildAge(){
      return TextFormField(
        decoration: InputDecoration(labelText:'Age'),
        validator: (String value){
          if(value.isEmpty){
            return 'Age is required';
          }
        },
        onSaved: (String value){
          phone=value;
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Register Veterinary')),
      body: SingleChildScrollView(
        child :Container(
          margin: EdgeInsets.all(24),
          child: Form(child: Column(
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
              RaisedButton(
                child:  Text(
                  'Submit',
                  style: TextStyle(color: Colors.blue,fontSize: 16),
                ),
                onPressed: ()=>{},
              )
            ],
          ),),
        ),

      ),
    );
  }
}


