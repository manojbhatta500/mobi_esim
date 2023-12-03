import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/topcontainer.dart';
import 'package:mobi_esim/models/model.dart';
import 'package:mobi_esim/providers/manager_provider.dart';
import 'package:mobi_esim/screens/region_buy.dart';
import 'package:provider/provider.dart';

class DataTab extends StatelessWidget {
  final String continent;
  final String? image;
  final String? provider;

  DataTab({
    required this.continent,
    required this.image,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Manager_Provider>(context);
    var currentRegionData = prov.currentRegion;
    prov.setaRegion(currentRegionData);
    var length = prov.aRegion.length;
    print('The length : $length');
    List<String> aRegion = prov.aRegion;
    print('The aRegion length : ${aRegion.length}');

    if (currentRegionData != null && currentRegionData.operators != null) {
      return ListView(
        children: [
          for (Operators operator in currentRegionData.operators!) ...[
            if (operator.packages != null && operator.packages!.isNotEmpty) ...[
              for (Packages package in operator.packages!) ...[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegionBuy(
                          continent: currentRegionData.title.toString(),
                          countries: length.toString(),
                          data: package.data.toString(),
                          image: currentRegionData.operators![0].image!.url
                              .toString(),
                          network: provider.toString(),
                          plan: currentRegionData.operators![0].planType
                              .toString(),
                          policy: currentRegionData
                              .operators![0].activationPolicy
                              .toString(),
                          price: '${package.price}',
                          validity: '${package.day}',
                        ),
                      ),
                    );
                  },
                  child: TopContainer(
                    coverage: currentRegionData.operators![0].countries!.length
                        .toString(),
                    data: package.data ?? '',
                    validity: '${package.day} days',
                    price: '${package.price}',
                    image: image,
                    provider: provider,
                  ),
                ),
              ],
            ],
          ],
        ],
      );
    } else {
      return Center(
        child: Text('no data here '),
      );
    }
  }
}

class CurrentRegion extends StatelessWidget {
  final String continent;
  final String? image;
  final String? provider;

  CurrentRegion({
    required this.continent,
    required this.image,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
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
            Container(
              height: 0.1 * height,
              width: double.infinity,
              child: TabBar(tabs: [
                Tab(
                  child: Container(
                    height: 0.06 * height,
                    width: 0.22 * width,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Color(0xff2941b8ea),
                        borderRadius: BorderRadius.circular(10)),
                    child: Tab(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          'Data only',
                          style: TextStyle(color: Color(0xff41b8ea)),
                        ),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 0.06 * height,
                    width: 0.22 * width,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Color(0xff2941b8ea),
                        borderRadius: BorderRadius.circular(10)),
                    child: Tab(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          'Data/call/Text',
                          style: TextStyle(color: Color(0xff41b8ea)),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              child: TabBarView(children: [
                DataTab(
                  continent: continent,
                  image: image,
                  provider: provider,
                ),
                Center(
                  child: Text('Data not available'),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
