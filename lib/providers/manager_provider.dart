import 'package:flutter/material.dart';

import 'package:mobi_esim/models/model.dart';

import 'package:mobi_esim/screens/supported_world.dart';

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

  // regions list

  List<Data?> _regions = [];

  List<Data?> get regions => _regions;

  void setRegions(List<Data?> regions) {
    _regions = regions;
    notifyListeners();
  }

  void storeSpecificRegionData() {
    // Check if _myData is not null
    if (_myData != null) {
      // Use a flag to ensure that this process is executed only once
      bool processed = false;

      // Check if the regions list is empty
      if (_regions.isEmpty) {
        List<String> targetRegionSlugs = [
          "caribbean-islands",
          "africa",
          "middle-east-and-north-africa",
          "asia"
        ];

        // Loop through the list of countries
        for (Data? countryData in _myData!.data!) {
          // Check if countryData is not null and if it matches any of the desired regionSlugs
          if (countryData != null &&
              targetRegionSlugs.contains(countryData.slug)) {
            // Store the region data
            _regions.add(countryData);
            print('Stored specific region data: ${countryData.title}');
            processed = true;
          }
        }
      }

      // Check if the process was executed
      if (processed) {
        // Schedule notifyListeners() to be called after the build is complete
        WidgetsBinding.instance.addPostFrameCallback((_) {
          notifyListeners();
          print('Stored specific region data completed');
        });
      } else {
        print('No specific region data to store');
      }
    }
  }
  //current region

  Data? _currentregion;
  Data? get currentRegion => _currentregion;

  void setcurrentregion(Data outregion) {
    _currentregion = outregion;
    notifyListeners();
  }

  //available regions

  List<String> _aRegion = [];
  List<String> get aRegion => _aRegion;

  void setaRegion(Data? regiondata) {
    clearregion();
    for (var country in regiondata!.operators![0].countries!) {
      _aRegion.add(country.countryCode.toString());
    }
    print('now  we are printing _aRegion');

    for (var i in _aRegion) {
      print('Region  contrycode: $i');
    }
    print('done printing');
  }

  void clearregion() {
    _aRegion.clear();
  }

  //world list

  Data? _worldData;

  Data? get worldData => _worldData;

  void fetchAndStoreWorldData() {
    if (_myData == null) {
      print('No overall data available.');
      return;
    }

    if (_worldData != null) {
      print('World data already stored.');
      return;
    }

    _worldData =
        _myData!.data?.firstWhere((countryData) => countryData.slug == 'world');

    if (_worldData != null) {
      print('Stored world data: ${_worldData!.title}');

      // Print the content of countryNames map
      print('Printing countryNames:');
      countryNames.forEach((code, name) {
        print('$code: $name');
      });

      print('created at : ${_worldData!.createdAt}');
      notifyListeners();
    } else {
      print('World data not found in the API response.');
    }
  }

  List<String> _wRegion = [];
  List<String> get wRegion => _wRegion;

  void setworlddata() {
    clearWorld();
    if (_worldData != null && _worldData!.operators != null) {
      for (var country in _worldData!.operators![0].countries!) {
        _wRegion.add(country.countryCode.toString());
      }
    }
    /* print('now  we are printing _WRegion');

    for (var i in _wRegion) {
      print('Region  contrycode: $i');
    }
    print('done printing');*/
  }

  void clearWorld() {
    _wRegion.clear();
  }
}
