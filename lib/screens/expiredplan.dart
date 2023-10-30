import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/plancontainer.dart';

class ExpiredPlan extends StatefulWidget {
  const ExpiredPlan({super.key});

  @override
  State<ExpiredPlan> createState() => _ExpiredPlanState();
}

class _ExpiredPlanState extends State<ExpiredPlan> {
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
