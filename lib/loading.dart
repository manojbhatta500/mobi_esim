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
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text(
                  'Loading',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            // If the Future throws an error, display the error message
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.data == null) {
            // If there is no data, display a message
            return Text('No data available.');
          } else {
            // If the Future is complete and the data is available, build the UI
            Data firstData = snapshot.data!.data![0];

            print('Title: ${firstData.title}');
            print('Country Code: ${firstData.countryCode}');
            print('Operator Title: ${firstData.operators?[0].title}');
            print(
                'network Title: ${firstData.operators?[0].coverages?[0].networks?[0].name}');
            print(
                'network Title: ${firstData.operators?[0].coverages?[0].networks?[1].name}');
            print('Package ID: ${firstData.operators?[0].packages?[0].id}');

            var datas = snapshot.data!.data;
            print('this is 0');
            print(datas![0].toString());

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Navigate()),
                      );
                    },
                    child: Center(child: Text('Continue'))),
              ],
            );
          }
        },
      ),
    );
  }
}
