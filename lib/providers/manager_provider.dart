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

  // Method to set the selected country data
  void setSelectedCountryData(Data data) {
    _selectedCountryData = data;
    print('so watch this ');
    print(data.countryCode);
    notifyListeners();
  }

  // Method to get the selected country data
  Data? getSelectedCountryData() {
    return _selectedCountryData;
  }
}
