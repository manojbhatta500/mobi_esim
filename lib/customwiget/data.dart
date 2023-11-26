import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/checkcountry.dart';
import 'package:mobi_esim/customwiget/countrydetails.dart';
import 'package:mobi_esim/customwiget/plandetails.dart';

import 'package:mobi_esim/providers/manager_provider.dart';
import 'package:provider/provider.dart';

class Data extends StatelessWidget {
  final String countrycode;

  Data({required this.countrycode});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Manager_Provider>(context);
    var realdata = prov.getSelectedCountryData();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: realdata?.operators![0].packages!.length ?? 0,
              itemBuilder: (context, index) {
                var package = realdata?.operators![0].packages![index];
                return GestureDetector(
                  onTap: () => navigateToCheckCountry(
                      context,
                      package?.data ?? '',
                      package?.day?.toString() ?? '',
                      package?.id?.toString() ?? '',
                      realdata,
                      package?.price?.toString() ?? ''),
                  child: PlanDetails(
                    countrycode: countrycode,
                    validity: package?.day?.toString() ?? '',
                    data: (package?.data ?? 0).toString(),
                    covrage: countryNames[countrycode]!,
                    checker: true,
                    price: (package?.price ?? 0).toString(),
                    name: package?.id?.toString() ?? '',
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void navigateToCheckCountry(BuildContext context, String data,
      String validity, String name, dynamic realdata, String price) {
    final prov = Provider.of<Manager_Provider>(context, listen: false);

    prov.setPackages(realdata?.operators[0]?.packages ?? []);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CheckCountry(
        countrycode: countrycode,
        data: data,
        validity: validity,
        title: name,
        price: price,
      );
    }));
  }
}
