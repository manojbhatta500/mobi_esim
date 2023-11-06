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
              child: RegContainer(
                countryname: 'Europe',
                image: 'assets/regions/euro.png',
              )),
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CurrentRegion(continent: 'asia');
                }));
              },
              child: RegContainer(
                countryname: 'Asia',
                image: 'assets/global.png',
              )),
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CurrentRegion(continent: 'North america');
                }));
              },
              child: RegContainer(
                countryname: 'North America',
                image: 'assets/regions/na.png',
              )),
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CurrentRegion(continent: 'south america');
                }));
              },
              child: RegContainer(
                countryname: 'South America',
                image: 'assets/regions/na.png',
              )),
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CurrentRegion(continent: 'africa');
                }));
              },
              child: RegContainer(
                countryname: 'Africa',
                image: 'assets/regions/africa.png',
              )),
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CurrentRegion(continent: 'Australia');
                }));
              },
              child: RegContainer(
                countryname: 'Australia',
                image: 'assets/regions/me.png',
              )),
          SizedBox(
            height: 40,
          )
        ],
      ),
    ));
  }
}
