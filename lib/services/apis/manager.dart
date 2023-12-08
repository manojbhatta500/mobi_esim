import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobi_esim/models/model.dart';
import 'package:mobi_esim/providers/manager_provider.dart';
import 'package:provider/provider.dart';

List<dynamic> data = [];

class Manager {
  Future<model> getData() async {
    var api = 'http://165.73.252.118:4000/api/package/';

    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);

      model myModel = model.fromJson(jsonData);

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

  Future<http.Response> RegisterUSer(String email) async {
    try {
      var api = 'http://165.73.252.118:4000/api/auth/register';

      Map<String, dynamic> requestData = {
        "email": "$email",
        "type": "email",
      };
      String requestBody = jsonEncode(requestData);

      final response = await http.post(
        Uri.parse(api),
        headers: {
          'Content-Type': 'application/json',
        },
        body: requestBody,
      );

      if (response.statusCode == 200) {
        print('Registration successful!');
        print('Response body: ${response.body}');
        return response;
      } else {
        print('Registration failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return response;
      }
    } catch (e) {
      print('$e is the error');
      rethrow;
    }
  }

  Future<http.Response> VerifyEmail(String email, String otp) async {
    try {
      var api = 'http://165.73.252.118:4000/api/auth/verify';

      Map<String, dynamic> requestData = {
        "email": "$email",
        "otp": "$otp",
        "type": "email"
      };

      String requestBody = jsonEncode(requestData);

      final response = await http.post(
        Uri.parse(api),
        headers: {
          'Content-Type': 'application/json',
        },
        body: requestBody,
      );

      if (response.statusCode == 200) {
        print('Registration successful!');
        print('Response body: ${response.body}');
        return response;
      } else {
        print('Registration failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return response;
      }
    } catch (e) {
      print('$e is the error');
      rethrow;
    }
  }

  Future<http.Response> DeleteUser(
    String email,
  ) async {
    try {
      var api = 'http://165.73.252.118:4000/api/auth/delete';

      Map<String, dynamic> requestData = {"email": "$email", "type": "email"};

      String requestBody = jsonEncode(requestData);

      final response = await http.post(
        Uri.parse(api),
        headers: {
          'Content-Type': 'application/json',
        },
        body: requestBody,
      );

      if (response.statusCode == 200) {
        print('account deleted successfully!');
        print('Response body: ${response.body}');

        return response;
      } else {
        print('Registration failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return response;
      }
    } catch (e) {
      print('$e is the error');
      rethrow;
    }
  }
}
