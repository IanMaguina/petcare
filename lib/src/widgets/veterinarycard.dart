import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petcare/const/icons_assets.dart';
import 'package:petcare/src/models/veterinary.dart';
import 'package:petcare/src/pages/veterinary_detail_page.dart';
import 'package:petcare/src/preferencias_usuario/favorite-vets.dart';

class VeterinaryCard extends StatefulWidget {
  final Veterinary vet;
  final Image icon;
  VeterinaryCard(this.vet, this.icon);

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
      ? 'agregaste ${vet.businessname} como favorita'
      : 'quitaste ${vet.businessname} de tus favoritos';

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
            title: _nombreVeterinaria(vet.businessname),
            subtitle: _direccionveterinaria(vet.address),
            trailing: IconButton(
              icon: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Tab(
                  icon: favIcon,
                ),
              ),
              onPressed: () {
                _onFavIconTap();
              },
            ),
            onTap: () {
              //hacer algo
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => VeterinaryDetailPage(vet),
              ));
            }),
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
