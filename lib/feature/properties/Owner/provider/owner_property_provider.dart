import 'package:flutter/widgets.dart';
import 'package:propertie_explore/feature/auth/model/user_model.dart';
import 'package:propertie_explore/feature/properties/Owner/model/propertie_model.dart';
import 'package:propertie_explore/feature/properties/Owner/services/owner_property_services.dart';

class OwnerPropertyProvider with ChangeNotifier {
  final OwnerPropertyServices _propertyServices = OwnerPropertyServices();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

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
    required String ownerName,
    required String title,
    required String propertyType,
    required double area,
    required double price,
    required int bed,
    required int bath,
    required String location,
    required String description,
    required String id,
    required String ownerID,
  }) async {
    setLoading(true);
    try {
      _propertyServices.UpdateProperty(
        ownerName: ownerName,
        title: title,
        propertyType: propertyType,
        area: area,
        price: price,
        bed: bed,
        bath: bath,
        location: location,
        description: description,
        id: id,
        ownerID: ownerID,
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
}
