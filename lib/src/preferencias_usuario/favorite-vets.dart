import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FavoriteVet {
  Stream<Set<String>> get favVets;

  bool isFavorite(String id);

  void switchFavoriteStatus(String id);

  Future<Set<String>> loadFavs();
}

class FavoriteVetsRepository implements FavoriteVet {
  static const _kFavoriteVetsPreferenceKey = 'FAVORITE_VET';
  List<String> fVets = [];

  var _favVetsController = PublishSubject<Set<String>>();

  @override
  Stream<Set<String>> get favVets {
    loadFavs();
    return _favVetsController.stream;
  }

  @override
  bool isFavorite(String id) {
    return fVets?.contains(id) ?? false;
  }

  @override
  Future<Set<String>> loadFavs() async {
    final _pref = SharedPreferences.getInstance();
    final pref = await _pref;
    fVets = pref.getStringList(_kFavoriteVetsPreferenceKey) ?? [];
    _favVetsController.add(fVets.toSet());
    return fVets.toSet();
  }

  @override
  void switchFavoriteStatus(String id) {
    final _pref = SharedPreferences.getInstance();
    if (isFavorite(id)) {
      fVets.remove(id);
    } else {
      fVets.add(id);
    }
    final favDots = fVets;
    _pref.then((value) {
      value.setStringList(_kFavoriteVetsPreferenceKey, favDots);
    });
    _favVetsController.add(fVets.toSet());
  }
}