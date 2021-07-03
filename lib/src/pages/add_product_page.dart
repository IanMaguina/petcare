import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:petcare/src/models/productv.dart';
import 'package:petcare/src/models/Regionemun.dart';
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/region.dart';
import 'package:petcare/src/models/uservet.dart';
import 'package:petcare/src/models/veterinary.dart';
import 'package:petcare/src/pages/login_page.dart';
import 'package:petcare/src/services/pets_service.dart';
import 'package:petcare/src/services/region_service.dart';
import 'package:petcare/src/services/service_service.dart';
import 'package:petcare/src/services/user_vet_service.dart';
import 'package:petcare/src/services/vet_service.dart';

//import 'login_page.dart';

class Add_Product_Page extends StatefulWidget {
   num tpid,pjpid,provid;

   String token;
  Add_Product_Page({this.tpid,this.pjpid,this.provid,this.token});

  @override
  _Add_Product_PageState createState() => _Add_Product_PageState(tpid:tpid,pjpid:pjpid,provid:provid,token:token);
}

class _Add_Product_PageState extends State<Add_Product_Page> {
  @override
  num tpid,pjpid,provid;
  String token;

  _Add_Product_PageState({this.tpid,this.pjpid,this.provid,this.token});

  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  //para guardar el veterinario
  ServicesService sService = new ServicesService();

  //Para el combo box de region
  // RegionService regionService = new RegionService();

  Productv pro = new Productv();

  bool _isLoading = false;

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  // final usuarioProvider = new UserService();

  @override
  Widget build(BuildContext context) {
    pro.id = 0;
    pro.PJPId =pjpid;
    pro.TypeProductId= tpid;
    Widget _buildBusinessName() {
      return TextFormField(
        initialValue: pro.name,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(labelText: 'Nombre de Servicio especifico'),
        onSaved: (value) => pro.name = value,
        validator: (value) {
          if (value.isEmpty) {
            return 'Ingrese nombre de servicio';
          }
          if (value.length < 3) {
            return 'minimo 6 caracteres';
          } else {
            return null;
          }
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Añada un producto por tipo'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(50),
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                _buildBusinessName(),
                _crearBoton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return ElevatedButton.icon(
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
      onPressed: () async {
        print('Posting data...');

        //PostData(uservet);
        _submit(context);
      },
    );
  }

  void _submit(BuildContext context) async {
    if (!formkey.currentState.validate()) {
      return;
    }
    //crea veterinario

    //Obtiene todos los veterinarios

    //obtiene la longitud de la lista

    formkey.currentState.save();
    //print(list);

    print(pro.id);
    print(pro.name);
    print(pro.PJPId);
    print(pro.TypeProductId);
    ServicesService sService = new ServicesService();

    final result = await sService.createService(pro,provid.toString(), token);

   /*Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LoginPage(),
    ));*/
  }
}

/*

/----------------------------------
class Add_Veterinary extends StatelessWidget{
  @override
  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    // TODO: implement build
    String businessname;
    String region;
    String field;
    String email;
    String address;
    String description;




    Widget _crearBoton(BuildContext context) {
      return ElevatedButton.icon(
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
        onPressed: () async {

          print('Posting data...');


          //PostData(uservet);
          _submit(context);
        },
      );
    }

    void _submit(BuildContext context) async {
      if (!formkey.currentState.validate()) {
        return;
      }
      //final result =await uvService.createUserv(uservet);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Add_Veterinary(),
      ));
      formkey.currentState.save();

    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registrar Veterinaria',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(50),
          child: Form(
            child: Column(
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
                      builder: (context) => LoginPage(),
                    ));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
