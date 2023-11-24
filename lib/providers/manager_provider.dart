import 'package:flutter/material.dart';
import 'package:mobi_esim/models/model.dart';

class Manager_Provider with ChangeNotifier {
  model? _myData;

  model? get myData => _myData;

  void updateData(model newData) {
    _myData = newData;
    notifyListeners();
  }
}
