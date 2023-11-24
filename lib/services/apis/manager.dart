import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobi_esim/models/model.dart';

List<dynamic> data = [];

class Manager {
  Future<model> getData() async {
    var api = 'http://165.73.252.118:4000/api/package/';

    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);

      model myModel = model.fromJson(jsonData);

      // Now you can access data using myModel
      if (myModel.data != null && myModel.data!.isNotEmpty) {
        Data firstData = myModel.data![0];

        // Accessing data
        String? countryCode = firstData.countryCode;
        String? imageUrl = firstData.image?.url;

        bool? isPrepaid = firstData.operators?[0].isPrepaid;
        String? operatorTitle = firstData.operators?[0].title;
        bool? isRoaming = firstData.operators?[0].isRoaming;
        List<String>? info = firstData.operators?[0].info;
        String? operatorImageUrl = firstData.operators?[0].image?.url;

        String? planType = firstData.operators?[0].coverages?[0].name;
        String? networkName =
            firstData.operators?[0].coverages?[0].networks?[0].name;

        // Accessing all data of packages
        firstData.operators?[0].packages?.forEach((package) {
          String? packageId = package.id;
          String? packageType = package.type;
          num? packagePrice = package.price;
          int? packageAmount = package.amount;
          int? packageDay = package.day;
          bool? isUnlimited = package.isUnlimited;
          String? packageTitle = package.title;
          String? packageData = package.data;
          String? packageShortInfo = package.shortInfo;

          // Print or use the package details as needed
          print('Package ID: $packageId');
          print('Package Type: $packageType');
          // ... other details
        });

        // Print or use the accessed data as needed
        print('Country Code: $countryCode');
        print('Image URL: $imageUrl');
        print('Is Prepaid: $isPrepaid');
        print('Operator Title: $operatorTitle');
        print('Is Roaming: $isRoaming');
        print('Info: $info');
        print('Operator Image URL: $operatorImageUrl');
        print('Plan Type: $planType');
        print('Network Name: $networkName');
      }

      return myModel;
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }
}
