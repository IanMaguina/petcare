import 'package:flutter/material.dart';
import 'package:petcare/src/widgets/custom_bottom_nav.dart';
import 'add_user_vet_page.dart';

class HomePage_ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        //physics: BouncingScrollPhysics(),
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            child: RaisedButton(
              child: Text('Ir'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddVetPage()));
              },
            ),
            color: Colors.green,
          ),
          Container(
            color: Colors.black,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.black,
          )
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  int get paginaActual => this._paginaActual;
  set paginaActual(int valor) {
    this._paginaActual = valor;
    notifyListeners();
  }
}
