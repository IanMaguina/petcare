import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:petcare/src/pages/ListarCitasPage.dart';
import 'package:petcare/src/pages/listPet_page.dart';
//import 'package:petcare/src/pages/ListarCitasPage.dart';
//import 'package:petcare/src/pages/list_veterinarias.dart';
import 'package:petcare/src/pages/news_page.dart';
import 'package:petcare/src/pages/pets_page.dart';
import 'package:petcare/src/pages/services_page.dart';
import 'package:petcare/src/pages/subcription_page.dart';
import 'package:petcare/src/pages/user_perfil.dart';
import 'package:petcare/src/widgets/lista_servicios.dart';
//import 'package:petcare/src/widgets/lista_veterinarias.dart';

class BottomBarVetScreen extends StatefulWidget {
  @override
  _BottomBarVetScreenState createState() => _BottomBarVetScreenState();
}

class _BottomBarVetScreenState extends State<BottomBarVetScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': SubcriptionPage(),
      },
      {
        'page': ListarCitasPage(),
      },
      {
        'page': NewsPage(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 25),
      child: Scaffold(
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomAppBar(
          // color: Colors.white,
          shape: CircularNotchedRectangle(),
          notchMargin: 0.01,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: kBottomNavigationBarHeight * 0.98,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
              ),
              child: BottomNavigationBar(
                onTap: _selectPage,
                backgroundColor: Theme.of(context).primaryColor,
                unselectedItemColor: Colors.grey,
                selectedItemColor: Color.fromRGBO(57, 179, 179, 1.0),
                currentIndex: _selectedPageIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.money),
                    label: "Subcripciones",
                  ),
                  BottomNavigationBarItem(
                    activeIcon: null,
                    icon: Icon(null),
                    label: "Citas",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Feather.user),
                    label: "Perfil",
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            hoverElevation: 10,
            backgroundColor: Color.fromRGBO(57, 179, 179, 1.0),
            splashColor: Colors.grey,
            tooltip: 'Citas',
            elevation: 4,
            child: Icon(Icons.date_range),
            onPressed: () => setState(() {
              _selectedPageIndex = 2;
            }),
          ),
        ),
      ),
    );
  }
}
