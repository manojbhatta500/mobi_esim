import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/checkcountry.dart';
import 'package:mobi_esim/customwiget/countrydetails.dart';
import 'package:mobi_esim/customwiget/plandetails.dart';

class Data extends StatelessWidget {
  final String countrycode;

  Data({required this.countrycode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CheckCountry(
                      countrycode: countrycode, data: '2', validity: '7');
                }));
              },
              child: PlanDetails(
                countrycode: countrycode,
                validity: '2',
                data: '7',
                covrage: countryNames[countrycode]!,
                checker: true,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CheckCountry(
                      countrycode: countrycode, data: '15', validity: '15');
                }));
              },
              child: PlanDetails(
                  countrycode: countrycode,
                  validity: '10',
                  checker: true,
                  data: '15',
                  covrage: countryNames[countrycode]!),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CheckCountry(
                      countrycode: countrycode, data: '30', validity: '30');
                }));
              },
              child: PlanDetails(
                  countrycode: countrycode,
                  validity: '30',
                  checker: true,
                  data: '30',
                  covrage: countryNames[countrycode]!),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
