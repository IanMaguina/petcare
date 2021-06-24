import 'package:flutter/material.dart';
import 'package:petcare/src/widgets/login_user_widget.dart';
import 'package:petcare/src/widgets/login_uservet_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 55,
        backgroundColor: Color.fromRGBO(57, 179, 179, 0.6),
        titleTextStyle: TextStyle(color: Colors.white),
        bottom: getTabBar(),
      ),
      body: Stack(
        children: <Widget>[
          _fondo(context),
          getTabBarView(<Widget>[LoginUserWidget(), LoginVetWidget()])
        ],
      ),
    );
  }

  TabBarView getTabBarView(var displays) {
    return TabBarView(
      children: displays,
      controller: _controller,
    );
  }

  TabBar getTabBar() {
    return TabBar(
      labelStyle: TextStyle(fontSize: 18.0),
      tabs: <Tab>[
        Tab(
          text: "Usuarios",
        ),
        Tab(
          text: "Veterinarios",
        ),
      ],
      controller: _controller,
    );
  }

  Widget _fondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoPrint = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(57, 179, 179, 1.0),
        Color.fromRGBO(66, 118, 166, 1.0),
      ])),
    );

    final texto = Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Icon(Icons.pets, color: Colors.white, size: 100.0),
          SizedBox(height: 10.0, width: double.infinity),
          Text('Pet Care',
              style: TextStyle(color: Colors.white, fontSize: 25.0))
        ],
      ),
    );
    return Stack(
      children: <Widget>[fondoPrint, texto],
    );
  }
}
