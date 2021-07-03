
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:petcare/src/models/Regionemun.dart';
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/providerjoinproduct.dart';
import 'package:petcare/src/models/region.dart';
import 'package:petcare/src/models/typeproductemun.dart';
import 'package:petcare/src/models/uservet.dart';
import 'package:petcare/src/models/veterinary.dart';
import 'package:petcare/src/pages/login_page.dart';
import 'package:petcare/src/services/providerjoinproduct_service.dart';
import 'package:petcare/src/services/region_service.dart';
import 'package:petcare/src/services/user_vet_service.dart';
import 'package:petcare/src/services/vet_service.dart';


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


class AddProviderjoinProduct_Page extends StatefulWidget {
  var data=<String>[];
  num id;
  String token;
  AddProviderjoinProduct_Page({this.data,this.id,this.token});
  @override
  _AddProviderjoinProduct_State createState() =>_AddProviderjoinProduct_State(data: data,id: id,token:token);
}

class _AddProviderjoinProduct_State extends State<AddProviderjoinProduct_Page > {
  var  data=<String>[];
  num id;
  String token;
  _AddProviderjoinProduct_State({this.data, this.id,this.token});
  final _suggestion = <String>[];
  final _saved = <String>[];
  final _savedid = <String>[];
  var _listid=<String>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  PJPService pjpS= new PJPService();

  //Para el combo box de region
  // RegionService regionService = new RegionService();


 // Providerjoinproduct pjp = new Providerjoinproduct();
  //PJPService get service => GetIt.I<PJPService>();
  @override
  Widget build(BuildContext context) {

    //  final wordPair = new WordPair.random();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        title: Text('Tipos de Servicios'),
    /*  actions: <Widget>[
         IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushNum ,
          )
        ],*/
      ),
      body: _buildSuggestions(),
      floatingActionButton: FloatingActionButton(
       onPressed:()async{
         _showMyDialog(context);
         //_pushSaved(context);

       },
        tooltip: 'Servicios seleccionados',
        child: Icon(Icons.check_circle),
      ),
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(FloatingActionButtonLocation.centerFloat, 0, 0),

    );
  }
  void _pushSaved(BuildContext context) async{

    for(int i=0;i<_saved.length;++i){
      print("FUNCIONA");
      print("ID ${_listid[i]}");
      print("Servicio  ${_saved[i]}");
      final result=await pjpS.createPJP(id.toString(),_listid[i],token);
    }

    Navigator.of(context).pop(context);
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmación'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('¿Conforme con los servicios seleccionados?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Si'),
              onPressed: () async{

                _pushSaved(context);
                  Navigator.of(context).pop(context);
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Widget _buildSuggestions() {
    final tp=new Typeproduct();
    var tp2=<String>[];
    var tp2id=<num>[];
    bool found=false;

  /*  for(int i=0;i<tp.typeproducts.length;++i){
      for(int j=0;j<data.length;++j){
        if(tp.typeproducts[i]==data[j]){
          print("COINCIDENCIA "+tp.typeproducts[i]);
          tp2.add(tp.typeproducts[i]);
          break;
        }
      }*/
      for(int i=0;i<tp.typeproducts.length;++i){
        for(int j=0;j<data.length;++j){
          if(tp.typeproducts[i]==data[j]){
            print("COINCIDENCIA "+tp.typeproducts[i]);
            found=true;
            break;
          }
        }
        if(!found) {
          tp2.add(tp.typeproducts[i]);
          print("posicion $i");
          tp2id.add(i+1);
        }
       found=false;
    }
    return ListView.builder(
      padding: const EdgeInsets.all(20.0),

      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Divider();
        }
        if (i < tp2.length*2) {

          final index = i~/2;
          return _buildRow(tp2[index],(tp2id[index]).toString());

          //    _suggestion.addAll(["hola","mundo"]);
          //   _suggestion.add();
        }


      },
    );
  }

  Widget _buildRow(String pair,String id) {
    print(" DATOS SON $pair y $id");
    final alreadySaved= _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.toString(),
        style: _biggerFont,
      ),
      trailing: Icon(alreadySaved?Icons.check_circle : Icons.check_circle_outline,
        color: alreadySaved ? Colors.teal :null,
      ),
      onTap: (){
        setState(() {
          if(alreadySaved){
            _listid.remove(id);
            _saved.remove(pair);
           // _savedid.remove(id);


          } else{
            _listid.add(id);
            _saved.add(pair);
           // _savedid.add(id);


           // print("EN POS 0 ${_savedid[0]}");
          }
        });
      },
    );


  }
}



