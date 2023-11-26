import 'package:flutter/material.dart';
import 'package:mobi_esim/models/model.dart';

class Manager_Provider with ChangeNotifier {
  //overall data
  model? _myData;

  model? get myData => _myData;

  void updateData(model newData) {
    _myData = newData;
    notifyListeners();
  }

  //selected country data

  Data? _selectedCountryData;

  void setSelectedCountryData(Data data) {
    _selectedCountryData = data;

    print(data.countryCode);
    notifyListeners();
  }

  Data? getSelectedCountryData() {
    return _selectedCountryData;
  }

  //current packages

  List<Packages>? _packages;

  void setPackages(List<Packages> packages) {
    _packages = packages;
    notifyListeners();
  }

  List<Packages>? get packages => _packages;
}
