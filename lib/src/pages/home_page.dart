import 'package:flutter/material.dart';
import 'CardVet.dart';
import 'add_pet_page.dart';
import 'CardVet.dart';
//import 'add_veterinary_page.dart';
import 'list_veterinarias.dart';
import 'add_user_vet_page.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      PageView(
        physics: BouncingScrollPhysics(),

        children: <Widget>[
          Container(
            child: RaisedButton(
              child: Text('Ir'),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>  Add_Vet()
                ));
                },
              )
            ,
            color: Colors.green,
          ),
          Container(
            color: Colors.black,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.black,
          )
        ],
      ),

    );
  }
}
