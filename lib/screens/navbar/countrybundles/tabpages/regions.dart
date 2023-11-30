import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/regcontainer.dart';
import 'package:mobi_esim/models/model.dart';
import 'package:mobi_esim/providers/manager_provider.dart';
import 'package:mobi_esim/screens/navbar/countrybundles/tabpages/regions/currentregion.dart';
import 'package:provider/provider.dart';

class Regions extends StatelessWidget {
  const Regions({Key? key});

  @override
  Widget build(BuildContext context) {
    List<Data?> regions = Provider.of<Manager_Provider>(context).regions;
    final prov = Provider.of<Manager_Provider>(context);
    prov.storeSpecificRegionData();

    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: screenHeight * 0.8,
              child: ListView.builder(
                itemCount: regions.length,
                itemBuilder: (context, index) {
                  Data? region = regions[index];

                  return GestureDetector(
                    onTap: () {
                      Provider.of<Manager_Provider>(context, listen: false)
                          .setcurrentregion(regions[index]!);

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CurrentRegion(
                          continent: region.title!,
                          image: region.operators![0].image!.url,
                          provider: region.operators![0].title,
                        );
                      }));
                    },
                    child: RegContainer(
                      countryname: region!.title!,
                      image: region.image!.url!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
