
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:petcare/src/models/Regionemun.dart';
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/productv.dart';

import 'package:petcare/src/models/providerjoinproduct.dart';
import 'package:petcare/src/models/region.dart';
import 'package:petcare/src/models/typeproductemun.dart';
import 'package:petcare/src/models/uservet.dart';
import 'package:petcare/src/models/veterinary.dart';
import 'package:petcare/src/pages/add_product_page.dart';
import 'package:petcare/src/pages/login_page.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';
import 'package:petcare/src/services/providerjoinproduct_service.dart';
import 'package:petcare/src/services/region_service.dart';
import 'package:petcare/src/services/service_service.dart';
import 'package:petcare/src/services/user_vet_service.dart';
import 'package:petcare/src/services/vet_service.dart';
import 'package:petcare/src/utils/custom_alert_dialog.dart';

import 'add_providerjoinproduct_page.dart';
import 'list_product_page.dart';


class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  FloatingActionButtonLocation location;
  double offsetX; // Offset in X direction
  double offsetY; // Offset in Y direction
  CustomFloatingActionButtonLocation(this.location, this.offsetX, this.offsetY);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    Offset offset = location.getOffset(scaffoldGeometry);
    return Offset(offset.dx + offsetX, offset.dy + offsetY);
  }
}


class ListProviderjoinProduct_Page extends StatefulWidget {

  var data=<Providerjoinproduct>[];
  var data2=<String>[];
  num id;
  String token;
  ListProviderjoinProduct_Page({this.data,this.data2,this.id,this.token});
  @override
  _ListProviderjoinProduct_State createState() =>_ListProviderjoinProduct_State(data: data,data2: data2,id: id,token:token);
}

class _ListProviderjoinProduct_State extends State<ListProviderjoinProduct_Page > {
 var  data=<Providerjoinproduct>[];
  var  data2=<String>[];
  PJPService pjpS= new PJPService();
  PJPService get service => GetIt.I<PJPService>();
  APIResponse<List<Providerjoinproduct>> _apiResponse;
  var tpemun= new Typeproduct() ;
  var pjplist2=<String>[];
/*  bool lec=false;
  var pjp=new   Providerjoinproduct();
  //objetos para pasar luego a prudct ,necesito ids
  var pjplist=<Providerjoinproduct>[];
  //para la mostrar
  */
  final _prefs = new PreferenciasUsuario();
  num id;
  String token;

  _ListProviderjoinProduct_State({this.data,this.data2, this.id,this.token});
  final _suggestion = <String>[];
  final _saved = <String>[];
  Productv pro = new Productv();
  final _biggerFont = const TextStyle(fontSize: 18);



  //Para agregar productos
  ServicesService sService = new ServicesService();


  //Para leer productos

  ServicesService get service2 => GetIt.I<ServicesService>();
  APIResponse<List<Productv>> _apiResponse2;



  @override

  Widget build(BuildContext context) {

    //  final wordPair = new WordPair.random();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        title: Text('Tipos de Servicios'),
      actions: <Widget>[
         IconButton(
            icon: Icon(Icons.refresh),
            onPressed: ()async {

               _submit(context);

              },
          )
        ],
      ),
      body: _buildSuggestions(),
      floatingActionButton: FloatingActionButton(
       onPressed:()async{
         Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AddProviderjoinProduct_Page(data:data2,id: id,token: token,),
    ));

         // _showMyDialog(context);
        // _pushSaved(context);

       },
        tooltip: 'Servicios seleccionados',
        child: Icon(Icons.add),
      ),
     // floatingActionButtonLocation: CustomFloatingActionButtonLocation(FloatingActionButtonLocation.centerFloat, 0, 0),

    );
  }
  void _pushSaved(BuildContext context) async{



  }
  void _submit(BuildContext context) async {
    /* if (!formkey.currentState.validate()) {
      return;
    }*/
    final id = _prefs.idvet;
    final token = _prefs.token;

      print("entra");
      _apiResponse = await service.getPJPsList(id.toString(),token);
      var last = _apiResponse.data.length;
      print(last);
      var list = _apiResponse.data;
      for (int i = 0; i < last; ++i) {
        pjplist2.add(tpemun.typeproducts[list[i].typeProductId - 1]);

      }
      //  pjplist2.add("");
      data2=pjplist2;

  /*  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ListProviderjoinProduct_Page(data:pjplist,data2: pjplist2,id: 2,token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjMiLCJuYmYiOjE2MjUwMDAwODIsImV4cCI6MTYyNTYwNDg4MiwiaWF0IjoxNjI1MDAwMDgyfQ.Q5yjhBMuOjy0uCwe0R4i46FmRFpHpKm5LqAOsHrzRPw'),
    ));*/
  }


  void showAlertDialog(BuildContext context,Providerjoinproduct pjp) {
    final mq = MediaQuery.of(context);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          TextEditingController _serviceControllerField =
          TextEditingController();
          return CustomAlertDialog(
            content: Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 4.5,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Text("Ingrese servicio especifico:"),
                  TextField(
                    controller: _serviceControllerField,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "",
                      labelText: "",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(25.0),
                      color: Color(0xff8c52ff),
                      child: MaterialButton(
                        minWidth: mq.size.width / 2,
                        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                        child: Text(
                          "Añadir",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          pro.id = 0;
                          pro.PJPId =pjp.id;
                          pro.TypeProductId= pjp.typeProductId;
                          pro.name= _serviceControllerField.text.toString();
                          final result = await sService.createService(pro,pjp.providerId.toString(), token);

                          Navigator.of(context).pop(context);
                          _buildSuggestions();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _buildSuggestions() {


    final tp=new Typeproduct();
    return ListView.builder(
      padding: const EdgeInsets.all(20.0),

      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Divider();
        }
        if (i <data2.length*2) {
          print(i);
          print(data2.length);

          final index = i~/2;
          print("index");
          print(index);
          print(data2[index]);
          print(data[index].typeProductId);
          print("   ");
          return _buildRow(data2[index],data[index]);

          //    _suggestion.addAll(["hola","mundo"]);
          //   _suggestion.add();

        }


      },
    );
  }


  void _lectura(BuildContext context,Providerjoinproduct pjp,String name) async {
    _apiResponse2 = await service2.getProductsList(pjp, token);
    var listproducts= <Productv>[];
    listproducts=_apiResponse2.data;
    print("AUN ES $name");
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>List_Product_Page(listp:listproducts ,pro:pro,name:name, pjp:pjp,token: token),
    ));
  }

  Widget _buildRow(var pair,Providerjoinproduct pjp) {
    var tpemun= new Typeproduct() ;
    final alreadySaved= _saved.contains(pair);

    return ListTile(
      title: Text(
        pair.toString(),
        style: _biggerFont,
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded ,
        color: Colors.teal,
      ),
      onTap: (){
       // setState(() { });
        print("typeProductId");
        print(pjp.typeProductId);
      // showAlertDialog(context,pjp);
        print("EL SERVICIO ESCOGIDO ES $pair");
        _lectura(context,pjp,pair);




      },
    );


  }


}



