import 'package:flutter/material.dart';
import 'package:petcare/src/pages/ListarCitasPage.dart';
import 'package:petcare/src/pages/list_veterinarias.dart';
import 'package:petcare/src/pages/news_page.dart';
import 'package:petcare/src/pages/pets_page.dart';
import 'package:petcare/src/pages/services_page.dart';
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
              backgroundColor: Colors.teal[600],
              icon: Icon(Icons.new_releases),
              title: Text('Inicio')),
          BottomNavigationBarItem(
              icon: Icon(Icons.shop), title: Text('Veterinarias')),
          BottomNavigationBarItem(
              icon: Icon(Icons.pets), title: Text('Mascotas')),
          BottomNavigationBarItem(icon: Icon(Icons.dock), title: Text('Citas')),
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
        ListVeterinariesPage(),
        PetsPage(),
        ListarCitasPage()
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
