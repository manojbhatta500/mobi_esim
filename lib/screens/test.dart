import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List<Map<String, dynamic>> countries = [];

  @override
  void initState() {
    super.initState();
    getcountries();
  }

  void getcountries() async {
    var api = 'http://165.73.252.118:4000/api/package/';

    try {
      http.Response response = await http.get(Uri.parse(api));

      if (response.statusCode == 200) {
        print('data fetched successfully');
        var data = jsonDecode(response.body);

        if (data is Map<String, dynamic> && data.containsKey('data')) {
          var dataMap = data['data'];

          setState(() {
            countries = List<Map<String, dynamic>>.from(dataMap);
            print('well data is saved successfully ${countries.toString()}');
          });
        } else {
          print('Invalid data format');
        }
      } else {
        print('something went wrong while fetching data ');
      }
    } catch (e) {
      print('Error during the HTTP request: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: double.infinity,
          child: ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) {
              // Access each country in the list
              if (countries.isNotEmpty) {
                var country = countries[index];
                return Center(
                  child: Column(
                    children: [
                      Text('${country['title']}'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('${country['image']['url']}'),
                      SizedBox(
                        height: 40,
                      ),
                      Image(image: NetworkImage('${country['image']['url']}'))
                    ],
                  ),
                );
              } else {
                // Return a loading indicator or an empty container
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
