import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/topcontainer.dart';
import 'package:mobi_esim/models/model.dart';
import 'package:mobi_esim/providers/manager_provider.dart';
import 'package:provider/provider.dart';

class CurrentRegion extends StatelessWidget {
  String continent;
  String? image;
  String? provider;

  CurrentRegion({
    required this.continent,
    required this.image,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final prov = Provider.of<Manager_Provider>(context);
    var currentRegionData = prov.currentRegion;
    prov.setaRegion(currentRegionData);
    var length = prov.aRegion.length;
    print('The leangth : $length');
    List<String> aRegion = prov.aRegion;
    print('The aRegion length : ${aRegion.length}');

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
                    ),
                  ),
                  SizedBox(
                    width: 0.2 * width,
                  ),
                  Text(
                    '$continent',
                    style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
                  ),
                ],
              ),
              if (currentRegionData != null &&
                  currentRegionData.operators != null) ...[
                for (Operators operator in currentRegionData.operators!) ...[
                  if (operator.packages != null &&
                      operator.packages!.isNotEmpty) ...[
                    for (Packages package in operator.packages!) ...[
                      TopContainer(
                        coverage: currentRegionData
                            .operators![0].countries!.length
                            .toString(),
                        data: package.data ?? '',
                        validity: '${package.day} days',
                        price: '${package.price}',
                        image: image,
                        provider: provider,
                      ),
                    ],
                  ],
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}
