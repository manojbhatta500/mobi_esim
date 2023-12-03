import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobi_esim/models/model.dart';
import 'package:mobi_esim/providers/manager_provider.dart';
import 'package:mobi_esim/screens/navigate.dart';

import 'package:provider/provider.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late Future<model> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<model> fetchData() async {
    var api = 'http://165.73.252.118:4000/api/package/';
    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      model myModel = model.fromJson(jsonData);
      final prov = Provider.of<Manager_Provider>(context, listen: false);
      prov.updateData(myModel);

      return myModel;
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<model>(
        future: futureData,
        builder: (context, snapshot) {
          // Check if the data has been loaded successfully
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // Print the error and navigate to the Navigate screen after a delay
              print('Error: ${snapshot.error}');
              Future.delayed(Duration.zero, () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Navigate()),
                );
              });
            } else {
              // Data loaded successfully, navigate to the Navigate screen after a delay
              Future.delayed(Duration.zero, () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Navigate()),
                );
              });
            }

            // Return an empty container as we don't want to display anything
            return Container();
          } else {
            // While the data is loading, or if there is an error, display a loading indicator
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator(),
                ),
                Center(
                  child: Text('Loading'),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
