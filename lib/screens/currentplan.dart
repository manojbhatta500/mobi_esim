import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/plancontainer.dart';
import 'package:mobi_esim/informant.dart';
import 'package:mobi_esim/providers/manager_provider.dart';
import 'package:provider/provider.dart';

class CurrentPlan extends StatelessWidget {
  const CurrentPlan({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Manager_Provider>(context);
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: prov.show
              ? Informant()
              : Column(
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
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                )),
    ));
  }
}
