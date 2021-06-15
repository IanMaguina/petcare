import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petcare/const/icons_assets.dart';
import 'package:petcare/src/bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/src/models/veterinary.dart';
import 'package:petcare/src/preferencias_usuario/favorite-vets.dart';
import 'package:petcare/src/preferencias_usuario/prefs.dart';
import 'package:rxdart/rxdart.dart';

class VetsBloc implements Bloc {
  final FavoriteVetsRepository _favoriteVetsRepository;
  List<Veterinary> vets = [];
  /* final String fav = 'assets/icons/fav.png';
  final String favBorder = 'assets/icons/fav_border.png'; */

  VetsBloc(FavoriteVetsRepository favoriteVetsRepository)
      : _favoriteVetsRepository = favoriteVetsRepository;

  final _vetStateController = PublishSubject<List<Veterinary>>();

  StreamSink<List<Veterinary>> get _vets => _vetStateController.sink;

  Stream<List<Veterinary>> get allvets => _vetStateController.stream;

  final _favVetStateController = PublishSubject<List<Veterinary>>();
  StreamSink<List<Veterinary>> get _favVets => _favVetStateController.sink;

  Stream<List<Veterinary>> get favVets => _favVetStateController.stream;

  String get urlPetcare {
    if (Platform.isAndroid) {
      return 'https://10.0.2.2:5001/api';
    } else {
      return 'https://localhost:5001/api';
    }
  }

  final apiKey = "";
  final _prefs = new PreferenciasUsuario();

  @override
  void dispose() {
    _vetStateController.close();
    _favVetStateController.close();
  }

  @override
  void init() {
    _loadFavPets();
    _loadData();
  }

  Image getFavIcon(String id) {
    _favoriteVetsRepository.loadFavs();
    return _favoriteVetsRepository.isFavorite(id)
        ? Image.asset(fav)
        : Image.asset(favBorder);
  }

  _loadData() async {
    var token = _prefs.token;

    /* final url = Uri.https('$urlPetcare', '/providers', {'q': '{http}'}); */
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };

    final url = Uri.parse('$urlPetcare/providers');
    http.Response resp = await http.get(url, headers: headers);
    var data;

    if (resp.statusCode == 200) {
      if (resp.body.isNotEmpty) {
        data = veterinaryFromJson(resp.body);
        vets.addAll(data);
      }
    }

    /* var json = jsonDecode(data);
    json.forEach((item) {
      vets.add(Veterinary.fromJson(item));
    }); */
    _vets.add(vets);
  }

  _loadFavPets() async {
    Set<String> favsId = await _favoriteVetsRepository.loadFavs();
    List<Veterinary> favpets = [];
    vets.forEach((vet) {
      if (favsId.contains(vet.id.toString())) {
        favpets.add(vet);
      }
    });
    _favVets.add(favpets);
  }
}
