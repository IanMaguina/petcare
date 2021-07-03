import 'package:flutter/material.dart';
import 'package:petcare/src/pages/ListarCitasPage.dart';
import 'package:petcare/src/pages/ListarCitasPage_vet.dart';
import 'package:petcare/src/pages/subcription_page.dart';
import 'package:petcare/src/pages/test_images.dart';
import 'package:petcare/src/pages/user_perfil_page.dart';
import 'package:petcare/src/pages/user_vet_perfil_page.dart';
import 'package:provider/provider.dart';

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
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      //physics: BouncingScrollPhysics(),
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        TestImagePage(),
        SubcriptionPage(),
        ListarCitasVetPage("1"), //idvet
        UserVetInfoPage("1"), //idvet
      ],
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
              backgroundColor: Color.fromRGBO(57, 179, 179, 1),
              icon: Icon(Icons.new_releases),
              label: 'Anuncios'),
          BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(57, 179, 179, 1),
              icon: Icon(Icons.money),
              label: 'Subscripciones'),
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
