import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mobi_esim/customwiget/reg_country2.dart';
import 'package:mobi_esim/models/global_itm.dart';
import 'package:mobi_esim/providers/manager_provider.dart';
import 'package:mobi_esim/screens/global_buy.dart';

import 'package:mobi_esim/screens/supported_world.dart';
import 'package:provider/provider.dart';

List<GlobalItem> real = [];

class Global extends StatelessWidget {
  const Global({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final prov = Provider.of<Manager_Provider>(context);
    prov.fetchAndStoreWorldData();
    prov.setaRegion(prov.worldData);

    var act_data = prov.worldData;
    print('this is a packages list');
    print(act_data!.operators![0].packages!.length);
    var packageLength = act_data.operators![0].packages!.length;
    var package = act_data.operators![0].packages!;
    String? image = act_data.image!.url;
    String cov = act_data.operators![0].countries!.length.toString();

    real.clear(); // Clear the existing list

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                height: 0.05 * height,
                width: double.infinity,
                child: TabBar(
                    indicatorColor: Colors.transparent,
                    indicator: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          height: 0.05 * height,
                          width: 0.3 * width,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color(0xff2941b8ea),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Data only',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 0.05 * height,
                          width: 0.3 * width,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color(0xff2941b8ea),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Center(
                              child: Text(
                                'Data/call/Text',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              Expanded(
                child: TabBarView(children: [
                  GestureDetector(
                    child: Container(
                      height: 0.8 * height,
                      child: ListView.builder(
                        itemCount: packageLength,
                        itemBuilder: (context, index) {
                          var package = act_data.operators![0].packages![index];

                          // Creating a widget and adding it to the 'real' list
                          Widget itemWidget = GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GlobalBuy(
                                    countries: cov.toString(),
                                    data: package.data.toString(),
                                    image: act_data.operators![0].image!.url
                                        .toString(),
                                    network:
                                        act_data.operators![0].title.toString(),
                                    plan: act_data.operators![0].planType
                                        .toString(),
                                    policy: act_data
                                        .operators![0].activationPolicy
                                        .toString(),
                                    price: package.price.toString(),
                                    validity: package.day.toString(),
                                    continent: 'Global',
                                  ),
                                ),
                              );
                            },
                            child: GlobalContainer(
                              checker: true,
                              image: image.toString(),
                              title: package.title.toString(),
                              coverage: cov,
                              validity: package.day.toString(),
                              price: package.price.toString(),
                              data: package.data.toString(),
                            ),
                          );

                          real.add(GlobalItem(
                              countries: cov.toString(),
                              validity: package.day.toString(),
                              price: package.price.toString(),
                              data: package.data.toString()));

                          return itemWidget;
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: Text('Data not available'),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GlobalContainer extends StatelessWidget {
  GlobalContainer({
    super.key,
    required this.image,
    required this.title,
    required this.coverage,
    required this.validity,
    required this.price,
    required this.data,
    required this.checker,
  });

  String image;
  String title;
  String coverage;
  String validity;
  String price;
  String data;

  bool checker;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print('the length of real is: ${real.length}');

    return Container(
      height: 0.3 * height,
      width: 0.6 * width,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
        color: Color(0xff2941b8ea),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$title',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              Image(
                image: NetworkImage('$image'),
                width: 0.2 * width,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.signal_cellular_alt),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Data',
                    style: TextStyle(color: Color(0xff464343), fontSize: 14),
                  ),
                ],
              ),
              Text(
                '$data',
                style: TextStyle(color: Color(0xff39393c), fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(CupertinoIcons.globe),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Coverage',
                    style: TextStyle(color: Color(0xff464343), fontSize: 14),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SupportedWorld(),
                    ),
                  );
                },
                child: RegCountry2(
                  number: coverage.toString(),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(CupertinoIcons.timer),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Validity',
                    style: TextStyle(color: Color(0xff464343), fontSize: 14),
                  ),
                ],
              ),
              Text(
                '$validity',
                style: TextStyle(color: Color(0xff39393c), fontSize: 14),
              ),
            ],
          ),
          checker
              ? Container(
                  width: 0.8 * width,
                  height: 0.06 * height,
                  decoration: BoxDecoration(
                    color: Color(0xff3b57a6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      '\$$price-Buy Now',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )
              : SizedBox(
                  height: 10,
                )
        ],
      ),
    );
  }
}
