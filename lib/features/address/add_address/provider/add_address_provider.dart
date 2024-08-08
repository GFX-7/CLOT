import 'package:clot/core/model/address_model.dart';
import 'package:clot/core/utils/hive_service.dart';
import 'package:flutter/cupertino.dart';

class AddAddressProvider extends ChangeNotifier {
  List<AddressModel> address = [];
  void save(AddressModel model) {
    HiveService.addAddress(model);
    address += HiveService.allAddress();
    notifyListeners();
  }

  void delete(AddressModel model) {
    HiveService.deleteAddress(model);
    notifyListeners();
  }

  notifyListeners();
}
