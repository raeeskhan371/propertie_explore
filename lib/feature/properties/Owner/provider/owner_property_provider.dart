import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:propertie_explore/feature/auth/model/user_model.dart';
import 'package:propertie_explore/feature/properties/Owner/model/propertie_model.dart';
import 'package:propertie_explore/feature/properties/Owner/services/owner_imager_picker.dart';
import 'package:propertie_explore/feature/properties/Owner/services/owner_property_services.dart';

class OwnerPropertyProvider with ChangeNotifier {
  final OwnerPropertyServices _propertyServices = OwnerPropertyServices();
  final OwnerImagerPicker _imagerPicker = OwnerImagerPicker();

  // Varaible
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<File> _selectedImage = [];
  List<File> get selectedImage => _selectedImage;

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
    } catch (e) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }

  // fetching  indivuial OwnerProperties
  Stream<List<PropertieModel>> fetchingOwnerProperties() {
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
    final image = await _imagerPicker.pickImageFromGallery();

    _selectedImage = image;
    notifyListeners();
  }
}
