import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/fullplandetails.dart';

class FullPlan extends StatelessWidget {
  final String countrycode;

  FullPlan({required this.countrycode});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              FullPlanDetails(
                countrycode: countrycode,
                validity: '2',
                data: '7',
                covrage: countrycode,
                minutes: '10',
                texts: '10',
                checker: true,
              ),
              FullPlanDetails(
                countrycode: countrycode,
                validity: '10',
                data: '15',
                covrage: countrycode,
                minutes: '100',
                texts: '100',
                checker: true,
              ),
              FullPlanDetails(
                countrycode: countrycode,
                validity: '30',
                data: '30',
                covrage: countrycode,
                minutes: '300',
                texts: '300',
                checker: true,
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
