import 'package:flutter/material.dart';
import 'package:petcare/src/pages/ListarCitasPage.dart';
import 'package:petcare/src/pages/add_providerjoinproduct_page.dart';
import 'package:petcare/src/pages/list_favveterinarias.dart';
import 'package:petcare/src/pages/list_pet_page.dart';
import 'package:petcare/src/pages/services_page.dart';
import 'package:petcare/src/pages/user_perfil_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
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

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
        currentIndex: navegacionModel.paginaActual,
        onTap: (i) => navegacionModel.paginaActual = i,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(57, 179, 179, 1.0),
              icon: Icon(Icons.medical_services),
              label: 'Servicios'),
          BottomNavigationBarItem(
              icon: Icon(Icons.pets), label: 'Mis Mascotas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range), label: 'Mis Citas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range), label: 'Mis veterinarias'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ]);
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      //physics: BouncingScrollPhysics(),
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[

        ListServicesPage(),
        ListPetPage(),
        ListarCitasPage(),
        XXXWilliam(),
        UserInfoPage(),

      ],
    );
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
