import 'package:flutter/material.dart';
import 'package:petcare/src/bloc/bloc_provider.dart';
import 'package:petcare/src/bloc/vets_bloc.dart';
import 'package:petcare/src/models/veterinary.dart';
import 'package:petcare/src/preferencias_usuario/favorite-vets.dart';
import 'package:petcare/src/widgets/veterinarycard.dart';

class HeadVeterinaryList extends StatelessWidget {
  HeadVeterinaryList();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: VetsBloc(FavoriteVetsRepository()),
      child: ListVeterinariesWPage(),
    );
  }
}

class ListVeterinariesWPage extends StatefulWidget {
  @override
  _ListVeterinariesWPageState createState() => _ListVeterinariesWPageState();
}

class _ListVeterinariesWPageState extends State<ListVeterinariesWPage> {
  List<Veterinary> vets = [];

  VetsBloc _vetsBloc;

  @override
  void initState() {
    _vetsBloc = BlocProvider.of(context);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _vetsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _vetsBloc.allvets,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            vets = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromRGBO(57, 179, 179, 1.0),
                elevation: 0.5,
                title: Text(
                  'Veterynaries by services',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: Container(
                child: ListView.builder(
                    itemCount: vets.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: VeterinaryCard(vets[index],
                            _vetsBloc.getFavIcon(vets[index].id.toString())),
                      );
                    }),
              ),
            );
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        });
  }
}
