import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petcare/const/colors.dart';
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/userperson.dart';
import 'package:petcare/src/pages/edit_userPersona.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';
import 'package:petcare/src/services/profile.dart';
import 'package:petcare/src/services/user_persona_service.dart';

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

APIResponse<UserPersona> personaresponse;

class _UserInfoPageState extends State<UserInfoPage> {
  UserPersonaService personService = new UserPersonaService();

  Profile profile = Profile();

  File profilePhoto;

  //bool _value = false;
  ScrollController _scrollController;
  var top = 0.0;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 4,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            ColorsConsts.starterColor,
                            ColorsConsts.endColor,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      title: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: top <= 110.0 ? 1.0 : 0,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  height: kToolbarHeight / 1.8,
                                  width: kToolbarHeight / 1.8,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 1.0,
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  // 'top.toString()',
                                  'Usuario',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      background: Image(
                        image: NetworkImage(
                            'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                child: FutureBuilder(
                    future: personService.getUser(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        final UserPersona userPersona = snapshot.data.data;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: userTitle('User Pets')),
                            Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Theme.of(context).splashColor,
                                child: ListTile(
                                  onTap: () =>
                                      Navigator.pushNamed(context, 'listpet'),
                                  title: Text('Mis Mascotas'),
                                  trailing: Icon(Icons.chevron_right_rounded),
                                  leading: Icon(
                                    Icons.pets,
                                    color: Color.fromRGBO(57, 179, 179, 1.0),
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: userTitle('User Information')),
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    personaresponse =
                                        await personService.getUser();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditUserPersonaPage(
                                                personaresponse.data),
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.edit),
                                  label: Text('Editar'),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            userListTile(
                                userPersona.name + " " + userPersona.lastName,
                                'Nombre',
                                0,
                                context),
                            userListTile(
                                userPersona.email, 'Email', 0, context),
                            userListTile(userPersona.phone.toString(),
                                'Teléfono', 0, context),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: userTitle('User settings'),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            _logoutButton('Cerrar Sesión', '', 4, context),
                          ],
                        );
                      }
                    }),
              )
            ],
          ),
        ],
      ),
    );
  }

  List<IconData> _userTileIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded
  ];

  Widget userListTile(
      String title, String subTitle, int index, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          onTap: () {},
          title: Text(title),
          subtitle: Text(subTitle),
          leading: Icon(_userTileIcons[index],
              color: Color.fromRGBO(57, 179, 179, 1.0)),
        ),
      ),
    );
  }

  Widget _logoutButton(
      String title, String subTitle, int index, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          onTap: () {
            //eliminar los datos de sharedPreference

            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
          title: Text(title),
          subtitle: Text(subTitle),
          leading: Icon(_userTileIcons[index],
              color: Color.fromRGBO(57, 179, 179, 1.0)),
        ),
      ),
    );
  }

  Widget userTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
      ),
    );
  }
}
