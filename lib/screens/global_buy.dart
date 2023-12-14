import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/checkcountry.dart';
import 'package:mobi_esim/customwiget/reg_country.dart';
import 'package:mobi_esim/providers/manager_provider.dart';
import 'package:mobi_esim/screens/navbar/countrybundles/tabpages/global.dart';
import 'package:mobi_esim/screens/redirect.dart';
import 'package:mobi_esim/screens/supported_region.dart';
import 'package:provider/provider.dart';

class GlobalBuy extends StatelessWidget {
  const GlobalBuy({
    super.key,
    required this.data,
    required this.countries,
    required this.validity,
    required this.price,
    required this.image,
    required this.network,
    required this.plan,
    required this.policy,
    required this.continent,
  });

  final String countries;
  final String data;
  final String validity;
  final String price;
  final String image;
  final String network;
  final String plan;
  final String policy;

  final String continent;

  String replaceDashWithSpace(String inputString) {
    return inputString.replaceAll('-', ' ');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final prov = Provider.of<Manager_Provider>(context);

    var act_data = prov.worldData;
    print('this is a packages list');
    print(act_data!.operators![0].packages!.length);
    var packageLength = act_data.operators![0].packages!.length;
    var package = act_data.operators![0].packages!;
    String? image = act_data.image!.url;
    String cov = act_data.operators![0].countries!.length.toString();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                  height: 0.3 * height,
                  width: width,
                  margin:
                      EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  decoration: BoxDecoration(
                      color: Color(0xff2941b8ea),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Image(
                          image: NetworkImage('$image'),
                          width: 100,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.globe,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Countries',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SupportedRegion()));
                            },
                            child: RegCountry(
                              number: '$countries',
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.signal_cellular_alt,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Data',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ],
                          ),
                          Text(
                            '$data',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.timer,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Validity',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ],
                          ),
                          Text(
                            ' $validity',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.money_dollar,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'price',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ],
                          ),
                          Text(
                            "\$ $price",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('available top-ups',
                    style: TextStyle(color: Color(0xff0082d8), fontSize: 15)),
              ),
              Container(
                width: width,
                height: 0.2 * height,
                child: CarouselSlider(
                  options: CarouselOptions(
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 1),
                  ),
                  items: real.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            height: 0.1 * height,
                            width: width,
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10, top: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            decoration: BoxDecoration(
                                color: Color(0xff2941b8ea),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.signal_cellular_alt,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Data',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${item.data}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.timer,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Validity',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      ' ${item.validity}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.money_dollar,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'price',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "\$ ${item.price}",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ));
                      },
                    );
                  }).toList(),
                ),
              ),
              Container(
                height: 0.2 * height,
                width: 0.9 * width,
                margin:
                    EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                decoration: BoxDecoration(
                    color: Color(0xff2941b8ea),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [Icon(Icons.network_cell), Text('Network')],
                        ),
                        Row(
                          children: [Text('$network')],
                        )
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [Icon(Icons.check_box), Text('Plan Type')],
                        ),
                        Row(
                          children: [Text('$plan')],
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.verified),
                            Text('policy'),
                          ],
                        ),
                        Row(
                          children: [Text(replaceDashWithSpace('$policy'))],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (prov.show == false) {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Redirect();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      isScrollControlled: true,
                    ).then((value) {
                      print('dismissed bottom modal sheet');
                    });
                  } else {
                    Navigator.pushNamed(context, '/signup');
                  }
                },
                child: Container(
                  width: 0.8 * width,
                  height: 0.06 * height,
                  decoration: BoxDecoration(
                      color: Color(0xff3b57a6),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    '\$$price Buy n',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
