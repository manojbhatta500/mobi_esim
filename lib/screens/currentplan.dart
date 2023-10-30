import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/plancontainer.dart';

class CurrentPlan extends StatelessWidget {
  const CurrentPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          PlanContainer(
            continentname: 'pakistan',
            countryname: 'Asia',
          ),
          PlanContainer(
            continentname: 'UK',
            countryname: 'Europe',
          ),
          PlanContainer(
            continentname: 'Usa',
            countryname: 'north america',
          )
        ],
      )),
    ));
  }
}
