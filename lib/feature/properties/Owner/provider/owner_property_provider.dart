import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:propertie_explore/core/pagination/pagination_result.dart';
import 'package:propertie_explore/feature/auth/model/user_model.dart';
import 'package:propertie_explore/feature/properties/Owner/model/propertie_model.dart';
import 'package:propertie_explore/feature/properties/Owner/owner_services/owner_imager_picker.dart';
import 'package:propertie_explore/feature/properties/Owner/owner_services/owner_property_services.dart';

class OwnerPropertyProvider with ChangeNotifier {
  final OwnerPropertyServices _propertyServices = OwnerPropertyServices();
  final OwnerImagerPicker _imagerPicker = OwnerImagerPicker();

  // Varaible
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<File> _selectedImage = [];
  List<File> get selectedImage => _selectedImage;

  //____________________________________________________
  // Pagination Variable for store Propertie
  List<PropertieModel> _properties = [];
  List<PropertieModel> get properties => _properties;
  //Pagination use for cursore
  DocumentSnapshot? _lastDocument;
  DocumentSnapshot? get lastDocument => _lastDocument;
  // pagination use for is firebase have more data ?
  bool _hasMoreData = true;
  bool get hastMoreData => _hasMoreData;

  // use for to prevent dublicate data

  bool _isFetchingMore = false;
  bool get isFetchingMore => _isFetchingMore;

  // Searching varaibles

  List<PropertieModel> _searchResults = [];

  List<PropertieModel> get searchResults => _searchResults;

  String _searchQuery = "";

  String get searchQuery => _searchQuery;

  //Searching Fucntionv
  Future<void> updateSearch(String value) async {
    print("Provider: $value");

    _searchQuery = value;
    notifyListeners();

    if (value.trim().isEmpty) {
      _searchResults = [];
      notifyListeners();
      return;
    }

    _searchResults = await _propertyServices.searchProperties(value);

    notifyListeners();
  }

  // Paginationn Function

  Future<void> fetchinProperties() async {
    if (_isFetchingMore || !_hasMoreData) return;

    try {
      _isFetchingMore = true;
      notifyListeners();

      final PaginationResult<PropertieModel> result = await _propertyServices
          .fetchProperties(lastDocument);
      print("[Pagin]New Properties: ${result.item.length}");

      _properties.addAll(result.item);
      debugPrint("[Pagin]Total Properties: ${_properties.length}");
      _lastDocument = result.lastDocument;
      debugPrint("[Pagin]Total LastDocument: ${_lastDocument}");
      _hasMoreData = result.hasMoreData;
      debugPrint("[Pagin]Total LastDocument: ${_hasMoreData}");

      notifyListeners();
    } catch (e) {
      rethrow;
    } finally {
      _isFetchingMore = false;
      notifyListeners();
    }
  }

  //____________________________________________________

  Future<void> addProperty({
    required String ownerName,
    required String title,
    required String propertyType,
    required double area,
    required double price,
    required int bed,
    required int bath,
    required String location,
    required String description,
    required List<File> imageFile,
  }) async {
    setLoading(true);
    debugPrint(
      "[ExplorePropertyApp](Provider) fetchingOwnerProperties() Called",
    );
    try {
      await _propertyServices.addProperty(
        ownerName: ownerName,
        title: title,
        propertyType: propertyType,
        area: area,
        price: price,
        bed: bed,
        bath: bath,
        location: location,
        description: description,
        imageFile: imageFile,
      );
      selectedImage.clear();
      notifyListeners();
    } catch (e) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }

  // fetching  indivuial OwnerProperties
  Stream<List<PropertieModel>> fetchingOwnerProperties() {
    debugPrint(
      "[ExplorePropertyApp](Provider) fetchingOwnerProperties() Called",
    );
    setLoading(true);
    try {
      return _propertyServices.fetchingOwnerProperties();
    } catch (e) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }

  // fetching  All OwnerProperties

  Stream<List<PropertieModel>> fetchingAllOwnerProperties() {
    debugPrint(
      "[ExplorePropertyApp](Provider) fetchingAllOwnerProperties() Called",
    );
    setLoading(true);
    try {
      return _propertyServices.allUserDataFetchingProperties();
    } catch (e) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }

  // updateProperty
  Future<void> UpdateProperty({
    required String title,
    required String propertyType,
    required double area,
    required double price,
    required int bed,
    required int bath,
    required String location,
    required String description,
    required String id,
    required List<String> oldImagesUrl,
  }) async {
    setLoading(true);
    debugPrint("[ExplorePropertyApp](Provider) UpdateProperty() Called");
    try {
      _propertyServices.UpdateProperty(
        title: title,
        propertyType: propertyType,
        area: area,
        price: price,
        bed: bed,
        bath: bath,
        location: location,
        description: description,
        id: id,
        imageFile: _selectedImage,
        oldImages: oldImagesUrl,
      );
    } catch (e) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }

  // deleteProperty

  Future<void> deleteProperty({required String id}) async {
    debugPrint("[ExplorePropertyApp](Provider) deleteProperty() Called");

    setLoading(true);

    try {
      _propertyServices.deleteProperty(id: id);
    } catch (e) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }

  // userFetching data

  Future<UserModel> userFetching() async {
    debugPrint("[ExplorePropertyApp](Provider) userFetching() Called");
    setLoading(true);
    try {
      return await _propertyServices.userFetching();
    } catch (e) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }

  /////// Helper Fuction
  ///

  String priceFormeter(double price) {
    debugPrint("[ExplorePropertyApp](Provider) priceFormater() Called");

    final formatter = NumberFormat("#,##0");

    return formatter.format(price);
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void removePreviewImage(int index) {
    _selectedImage.removeAt(index);
    notifyListeners();
  }

  Future<void> pickPopertyImage() async {
    debugPrint("[ExplorePropertyApp](Provider) pickPopertyImage() Called");
    final image = await _imagerPicker.pickImageFromGallery();
    _selectedImage = image;

    notifyListeners();
  }
}
