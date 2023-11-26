import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/checkcountry.dart';
import 'package:mobi_esim/customwiget/countrydetails.dart';
import 'package:mobi_esim/customwiget/plandetails.dart';
// Import your model
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
            // Display plans using ListView.builder
            ListView.builder(
              shrinkWrap: true,
              itemCount: realdata?.operators![0].packages!.length ?? 0,
              itemBuilder: (context, index) {
                var package = realdata?.operators![0].packages![index];
                return GestureDetector(
                  onTap: () => navigateToCheckCountry(
                    context,
                    package?.id ?? '',
                    package?.day?.toString() ?? '',
                  ),
                  child: PlanDetails(
                    countrycode: countrycode,
                    validity: package?.day?.toString() ?? '',
                    data: (package?.data ?? 0).toString(),
                    covrage: countryNames[countrycode]!,
                    checker: true,
                    price: (package?.price ?? 0).toString(),
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

  void navigateToCheckCountry(
      BuildContext context, String data, String validity) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CheckCountry(
        countrycode: countrycode,
        data: data,
        validity: validity,
      );
    }));
  }
}
