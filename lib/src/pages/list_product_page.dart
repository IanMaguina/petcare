
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
import 'package:petcare/src/services/providerjoinproduct_service.dart';
import 'package:petcare/src/services/region_service.dart';
import 'package:petcare/src/services/service_service.dart';
import 'package:petcare/src/services/user_vet_service.dart';
import 'package:petcare/src/services/vet_service.dart';
import 'package:petcare/src/utils/custom_alert_dialog.dart';


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


class List_Product_Page extends StatefulWidget {
  var listp =<Productv>[] ;
  var pjp=Providerjoinproduct();

  var name;
  Productv pro;
  num id;
  String token;
  List_Product_Page({this.listp,this.pro,this.name,this.pjp,this.token});
  @override
  _List_Product_State createState() =>_List_Product_State(listp:listp,pro:pro,name:name,pjp:pjp,token:token);

}

class _List_Product_State extends State<List_Product_Page > {
  var listp = <Productv>[];
  bool open=false;
  var name;
  var pjp = Providerjoinproduct();
  ServicesService sService = new ServicesService();
  ServicesService get service2 => GetIt.I<ServicesService>();
  APIResponse<List<Productv>> _apiResponse2;

  Productv pro;

  //var  data2=<String>[];
  num id;
  String token;

  _List_Product_State({this.listp, this.pro,this.name, this.pjp, this.token});

  final _suggestion = <String>[];
  var _saved = <Productv>[];
  final _savedid = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18);


  //PJPService get service => GetIt.I<PJPService>();

  @override
  Widget build(BuildContext context) {
    //  final wordPair = new WordPair.random();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        title: Text(name.toString()),
        actions: <Widget>[
         /* IconButton(
            icon: Icon(Icons.list),
            onPressed: () async{
              showAlertDialog(context);

              },

          )*/
        ],
      ),
      body: _buildSuggestions(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // _showMyDialog(context);
          // _pushSaved(context);
          showAlertDialog(context);
        },
        tooltip: 'Servicios seleccionados',
        child: Icon(Icons.add_circle_outlined),
      ),
     // floatingActionButtonLocation: CustomFloatingActionButtonLocation(
     //     FloatingActionButtonLocation.centerFloat, 0, 0),

    );
  }
  void _lectura(BuildContext context,Providerjoinproduct pjp) async {
    _apiResponse2 = await service2.getProductsList(pjp, token);

    listp=_apiResponse2.data;
    _buildSuggestions();

  }
  void showAlertDialog(BuildContext context) {
    final mq = MediaQuery.of(context);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          TextEditingController _serviceControllerField =
          TextEditingController();
          return CustomAlertDialog(
            content: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 1.2,
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 4.5,
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
                          pro.PJPId = pjp.id;
                          pro.TypeProductId = pjp.typeProductId;
                          pro.name = _serviceControllerField.text.toString();
                          final result = await sService.createService(
                              pro, pjp.providerId.toString(), token);
                          _lectura(context, pjp);
                          Navigator.of(context).pop();
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
    final tp = new Typeproduct();
    return ListView.builder(
      padding: const EdgeInsets.all(20.0),

      itemBuilder: (context, i) {
        print("la longitud es ${listp.length}");
        if (i.isOdd) {
          return Divider();
        }
        if (i < (listp.length) * 2) {
          final index = i ~/ 2;
          print(index);
          print(listp[index].name);
          return _buildRow(listp[index].name);

          //    _suggestion.addAll(["hola","mundo"]);
          //   _suggestion.add();
        }
      },
    );
  }

  Widget _buildRow(var pair) {
    var tpemun = new Typeproduct();
    return ListTile(
      title: Text(
        pair.toString(),
        style: _biggerFont,
      ),
      /* trailing: Icon(Icons.arrow_forward_ios_rounded ,
        color: Colors.teal,
      ),
      onTap: (){
       // setState(() { });
 //       Navigator.of(context).push(MaterialPageRoute(
 //         builder: (context) =>Add_Product_Page(),
//        ));

      },*/
    );
  }


}
