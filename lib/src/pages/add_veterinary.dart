import 'package:flutter/material.dart';
import 'package:petcare/src/pages/welcome_page.dart';
import 'package:petcare/src/widgets/login_uservet_widget.dart';

import 'login_page.dart';

class Add_Veterinary extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String businessname;
    String region;
    String field;
    String email;
    String address;
    String description;


    Widget _buildBusinessName(){
      return TextFormField(

        decoration: InputDecoration(labelText:'Nombre de Veterinaria'),
        validator: (String value){
          if(value.isEmpty){
            return 'Nombre de Veterinaria es requerida';
          }
        },
        onSaved: (String value){
          businessname=value;
        },
      );
    }
    Widget _buildRegion(){
      return TextFormField(
        decoration: InputDecoration(labelText:'Region'),
        validator: (String value){
          if(value.isEmpty){
            return 'Region es requerida';
          }
        },
        onSaved: (String value){
          region=value;
        },
      );
    }
    Widget _buildField(){
      return TextFormField(
        decoration: InputDecoration(labelText:'Campo'),
        validator: (String value){
          if(value.isEmpty){
            return 'Campo es requerido';
          }
        },
        onSaved: (String value){
          field=value;
        },
      );
    }
    Widget _buildEmail(){
      return TextFormField(
        decoration: InputDecoration(labelText:'Email'),
        validator: (String value){
          if(value.isEmpty){
            return 'Email es requerido';
          }
        },
        onSaved: (String value){
          email=value;
        },
      );
    }
    Widget _buildAddress(){
      return TextFormField(
        decoration: InputDecoration(labelText:'Direccion'),
        validator: (String value){
          if(value.isEmpty){
            return 'Direccion es requerida';
          }
        },
        onSaved: (String value){
          address=value;
        },
      );
    }
    Widget _buildDescription(){
      return TextFormField(
        decoration: InputDecoration(labelText:'Descripcion '),
        validator: (String value){
          if(value.isEmpty){
            return 'Descripcion es requerido';
          }
        },
        onSaved: (String value){
          description=value;
        },
      );
    }


    return Scaffold(
      appBar: AppBar(title: Text('Registrar Veterinaria'
        , style: TextStyle(color: Colors.white) ,
           ),
      )
      ,
      body: SingleChildScrollView(
        child :Container(
          margin: EdgeInsets.all(50),
          child: Form(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildBusinessName(),
              _buildRegion(),
              _buildField(),
              _buildEmail(),
              _buildAddress(),
              _buildDescription(),

              SizedBox(height: 100),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  primary: Color.fromRGBO(57, 179, 179, 1.0),
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                label: Text('Registrar'),
                icon: Icon(Icons.save),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder:(context)=>LoginPage(),
                  ));
                },
              )
            ],
          ),),
        ),

      ),
    );
  }
}