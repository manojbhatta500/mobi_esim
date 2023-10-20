import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/plandetails.dart';

class CountryDetails extends StatelessWidget {
  final String countrycode;

  CountryDetails({required this.countrycode});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff3b57a6),
                    )),
                SizedBox(
                  width: 0.35 * width,
                ),
                Text(
                  '$countrycode',
                  style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
                )
              ],
            ),
            SizedBox(
              height: 0.02 * height,
            ),
            PlanDetails(
                countrycode: countrycode,
                validity: '2',
                data: '7',
                covrage: countrycode),
            PlanDetails(
                countrycode: countrycode,
                validity: '10',
                data: '15',
                covrage: countrycode),
            PlanDetails(
                countrycode: countrycode,
                validity: '30',
                data: '30',
                covrage: countrycode),
          ],
        ),
      ),
    ));
  }
}
