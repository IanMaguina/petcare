import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:petcare/src/pages/ListarCitasPage.dart';
import 'package:petcare/src/pages/listPet_page.dart';
//import 'package:petcare/src/pages/ListarCitasPage.dart';
//import 'package:petcare/src/pages/list_veterinarias.dart';
import 'package:petcare/src/pages/news_page.dart';
import 'package:petcare/src/pages/pets_page.dart';
import 'package:petcare/src/pages/services_page.dart';
import 'package:petcare/src/pages/user_perfil.dart';
import 'package:petcare/src/widgets/lista_servicios.dart';
//import 'package:petcare/src/widgets/lista_veterinarias.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': ListServicesPage(),
      },
      {
        'page': UserInfoPage(),
      },
      {
        'page': ListPet(),
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
                    color: Colors.grey,
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
                    icon: Icon(Icons.medical_services),
                    label: "Servicios",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Feather.user),
                    label: "Usuario",
                  ),
                  BottomNavigationBarItem(
                    activeIcon: null,
                    icon: Icon(null),
                    label: "Mis mascotas",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.date_range,
                    ),
                    label: "Mis Citas",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Feather.book_open),
                    label: "Consejos",
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
            tooltip: 'Mis Mascotas',
            elevation: 4,
            child: Icon(Icons.pets),
            onPressed: () => setState(() {
              _selectedPageIndex = 2;
            }),
          ),
        ),
      ),
    );
  }
}
