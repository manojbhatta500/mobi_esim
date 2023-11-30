import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/reg_country.dart';
import 'package:mobi_esim/customwiget/reg_country2.dart';
import 'package:mobi_esim/providers/manager_provider.dart';
import 'package:mobi_esim/screens/sup_world.dart';
import 'package:mobi_esim/screens/supported_region.dart';
import 'package:provider/provider.dart';

class Global extends StatelessWidget {
  const Global({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final prov = Provider.of<Manager_Provider>(context);
    prov.fetchAndStoreWorldData();
    var act_data = prov.worldData;
    print('this is a packages list');
    print(act_data!.operators![0].packages!.length);
    var packageLength = act_data.operators![0].packages!.length;
    String? image = act_data.image!.url;
    String cov = act_data.operators![0].countries!.length.toString();

    return SafeArea(
        child: Scaffold(
            body: Container(
                height: 0.8 * height,
                child: ListView.builder(
                  itemCount: packageLength,
                  itemBuilder: (context, index) {
                    var package = act_data.operators![0].packages![index];
                    return GlobalContainer(
                        image: image.toString(),
                        title: package.title.toString(),
                        coverage: cov,
                        validity: package.day.toString(),
                        price: package.price.toString(),
                        data: package.data.toString());
                  },
                ))));
  }
}

class GlobalContainer extends StatelessWidget {
  GlobalContainer(
      {super.key,
      required this.image,
      required this.title,
      required this.coverage,
      required this.validity,
      required this.price,
      required this.data});
  String image;
  String title;
  String coverage;
  String validity;
  String price;
  String data;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: 0.4 * height,
      width: 0.6 * width,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
          color: Color(0xff2941b8ea), borderRadius: BorderRadius.circular(20)),
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
                width: 100,
              )
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
                  Icon(CupertinoIcons.tree),
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
                          builder: (context) =>
                              SupportedRegion(checker: true)));
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
          Container(
            width: 0.8 * width,
            height: 0.06 * height,
            decoration: BoxDecoration(
                color: Color(0xff3b57a6),
                borderRadius: BorderRadius.circular(20)),
            child: Center(
                child: Text(
              '\$${price}-View details',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          )
        ],
      ),
    );
  }
}
