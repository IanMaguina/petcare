import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petcare/const/icons_assets.dart';
import 'package:petcare/src/models/veterinary.dart';
import 'package:petcare/src/pages/add_veterinary.dart';
import 'package:petcare/src/preferencias_usuario/favorite-vets.dart';

class VeterinaryCard extends StatefulWidget {
  final Veterinary vet;
  final Image icon;

  const VeterinaryCard(this.vet, this.icon);

  @override
  State<StatefulWidget> createState() => _VeterinaryCardState(vet, icon);
}

class _VeterinaryCardState extends State<VeterinaryCard> {
  Veterinary vet;
  FavoriteVetsRepository _vetsRepository;
  Image favIcon;

  _VeterinaryCardState(this.vet, this.favIcon);

  @override
  void initState() {
    _vetsRepository = FavoriteVetsRepository();
    super.initState();
  }

  _getFavIcon() {
    return _vetsRepository.isFavorite(vet.id.toString())
        ? Image.asset(fav)
        : Image.asset(favBorder);
  }

  _getToastMsg() => _vetsRepository.isFavorite(vet.id.toString())
      ? 'Now this is your fav vet ${vet.businessName} :)'
      : 'This not your favorite ${vet.businessName} :(';

  _onFavIconTap() {
    setState(() {
      _vetsRepository.switchFavoriteStatus(vet.id.toString());
      favIcon = _getFavIcon();
    });
    Fluttertoast.showToast(msg: _getToastMsg());
  }

  @override
  Widget build(BuildContext context) {
    _vetsRepository.loadFavs();
    return Column(
      children: <Widget>[
        ListTile(
            leading: _fotoVeterinaria("assets/images/local3.png"),
            title: _nombreVeterinaria(vet.businessName),
            subtitle: _direccionveterinaria(vet.address),
            trailing: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Tab(
                icon: favIcon,
              ),
            ),
            onTap: _onFavIconTap),
        Divider(),
      ],
    );
  }

  _fotoVeterinaria(String url) {
    return Image(
      image: AssetImage(url),
    );
  }

  _nombreVeterinaria(String nombre) {
    return Text(nombre);
  }

  _direccionveterinaria(String dir) {
    return Text(dir);
  }
}
