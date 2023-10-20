import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/regcontainer.dart';

class Regions extends StatelessWidget {
  const Regions({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          RegContainer(countryname: 'Europe'),
          RegContainer(countryname: 'Asia'),
          RegContainer(countryname: 'North America'),
          RegContainer(countryname: 'South America'),
          RegContainer(countryname: 'Africa'),
          RegContainer(countryname: 'Australia'),
          SizedBox(
            height: 40,
          )
        ],
      ),
    ));
  }
}
