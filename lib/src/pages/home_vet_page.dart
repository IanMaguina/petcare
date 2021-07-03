import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/providerjoinproduct.dart';
import 'package:petcare/src/models/typeproductemun.dart';
import 'package:petcare/src/pages/ListarCitasPage.dart';
import 'package:petcare/src/pages/ListarCitasPage_vet.dart';
import 'package:petcare/src/pages/subcription_page.dart';
import 'package:petcare/src/pages/test_images.dart';
import 'package:petcare/src/pages/user_perfil_page.dart';
import 'package:petcare/src/pages/user_vet_perfil_page.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';
import 'package:petcare/src/services/providerjoinproduct_service.dart';
import 'package:provider/provider.dart';

import 'list_providerjoinproduct_page.dart';

class HomeVetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Paginas extends StatelessWidget {
  PJPService pjpS = new PJPService();
  PJPService get service => GetIt.I<PJPService>();
  APIResponse<List<Providerjoinproduct>> _apiResponse;
  var tpemun = new Typeproduct();
  bool lec = false;
  var pjp = new Providerjoinproduct();
  //objetos para pasar luego a prudct ,necesito ids
  var pjplist = <Providerjoinproduct>[];
  //para la mostrar
  var pjplist2 = <String>[];
  final _prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    final id = _prefs.idvet;
    final token = _prefs.token;
    bool open = false;
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    if (!open) {
      _submit(context);
      open = true;
    }
    return PageView(
      //physics: BouncingScrollPhysics(),
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        TestImagePage(),
        //SubcriptionPage(),
        ListProviderjoinProduct_Page(
            data: pjplist, data2: pjplist2, id: id, token: token),
        ListarCitasVetPage(), //idvet
        UserVetInfoPage(), //idvet
      ],
    );
  }

  void _submit(BuildContext context) async {
    /* if (!formkey.currentState.validate()) {
      return;
    }*/
    final id = _prefs.idvet;
    final token = _prefs.token;
    if (!lec) {
      print("entra");
      _apiResponse = await service.getPJPsList(id.toString(), token);
      var last = _apiResponse.data.length;
      print(last);
      var list = _apiResponse.data;
      for (int i = 0; i < last; ++i) {
        print(list[i].id);
        pjp.id = list[i].id;
        print("providerId");
        print(list[i].providerId);
        pjp.providerId = list[i].providerId;
        print("typeProductId");
        print(list[i].typeProductId);
        print(tpemun.typeproducts[list[i].typeProductId - 1]);
        pjp.typeProductId = list[i].typeProductId;
        print("  ");

        pjplist2.add(tpemun.typeproducts[list[i].typeProductId - 1]);
        pjplist.add(new Providerjoinproduct.c(
            list[i].id, list[i].providerId, list[i].typeProductId));
        print("     ");
      }
      //  pjplist2.add("");
      for (int i = 0; i < last; ++i) {
        print("Id");
        print(pjplist[i].id);
        print("ProviderId");
        print(pjplist[i].providerId);
        print("TypeProductId");
        print(pjplist[i].typeProductId);

        print("     ");
      }
      lec = true;
    }
    /*Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ListProviderjoinProduct_Page(data:pjplist,data2: pjplist2,id: 2,token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjMiLCJuYmYiOjE2MjUwMDAwODIsImV4cCI6MTYyNTYwNDg4MiwiaWF0IjoxNjI1MDAwMDgyfQ.Q5yjhBMuOjy0uCwe0R4i46FmRFpHpKm5LqAOsHrzRPw'),
    ));*/
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
        currentIndex: navegacionModel.paginaActual,
        onTap: (i) => navegacionModel.paginaActual = i,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(57, 179, 179, 1),
              icon: Icon(Icons.new_releases),
              label: 'Anuncios'),
          BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(57, 179, 179, 1),
              icon: Icon(Icons.money),
              label: 'Servicios'),
          BottomNavigationBarItem(icon: Icon(Icons.date_range), label: 'Citas'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ]);
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;

  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;
  set paginaActual(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);

    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
