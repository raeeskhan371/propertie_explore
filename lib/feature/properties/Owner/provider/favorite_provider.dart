import 'package:flutter/foundation.dart';
import 'package:propertie_explore/feature/properties/Owner/model/propertie_model.dart';
import 'package:propertie_explore/feature/properties/Owner/owner_services/favoirte_services.dart';

class FavoriteProvider extends ChangeNotifier {
  FavouriteServices _favouriteServices = FavouriteServices();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isFavourite = false;
  bool get isFavoruite => _isFavourite;

  bool isFavourite(bool value) {
    _isFavourite = value;
    notifyListeners();
    debugPrint("isFavourite Called()");

    return _isFavourite;
  }

  List<PropertieModel> _favoritePoperty = [];
  List<PropertieModel> get favoritePoperty => _favoritePoperty;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> addFavouriteProperties(String id) async {
    final properties = await _favouriteServices.addFavorite(id);
  }

  Future<List<PropertieModel>> getFavoriteProperties() async {
    _favoritePoperty.clear();
    final properties = await _favouriteServices.getFavoriteProperties();

    _favoritePoperty.clear();
    _favoritePoperty.addAll(properties);
    notifyListeners();

    debugPrint("Favourite Item :>>>>>> ${_favoritePoperty.length}");

    return _favoritePoperty;
  }

  Future<void> remove(String id) async {
    notifyListeners();

    await _favouriteServices.removeFavuoirte(id);

    notifyListeners();
  }

  void removeFromLocalList(int index) {
    _favoritePoperty.removeAt(index);
    _isFavourite = false;

    notifyListeners();
  }
}
