import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/regcontainer.dart';
import 'package:mobi_esim/screens/navbar/countrybundles/tabpages/regions/currentregion.dart';

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
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CurrentRegion(continent: 'Europe');
                }));
              },
              child: RegContainer(countryname: 'Europe')),
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CurrentRegion(continent: 'asia');
                }));
              },
              child: RegContainer(countryname: 'Asia')),
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CurrentRegion(continent: 'North america');
                }));
              },
              child: RegContainer(countryname: 'North America')),
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CurrentRegion(continent: 'south america');
                }));
              },
              child: RegContainer(countryname: 'South America')),
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CurrentRegion(continent: 'africa');
                }));
              },
              child: RegContainer(countryname: 'Africa')),
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CurrentRegion(continent: 'Australia');
                }));
              },
              child: RegContainer(countryname: 'Australia')),
          SizedBox(
            height: 40,
          )
        ],
      ),
    ));
  }
}
