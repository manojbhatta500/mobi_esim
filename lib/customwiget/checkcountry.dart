import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/add_info.dart';
import 'package:mobi_esim/customwiget/countrydetails.dart';

import 'package:mobi_esim/customwiget/plandetails.dart';
import 'package:mobi_esim/providers/manager_provider.dart';
import 'package:mobi_esim/screens/redirect.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:mobi_esim/models/model.dart';

class CheckCountry extends StatefulWidget {
  final String countrycode;
  final String title;
  final String validity;
  final String data;
  final String price;
  CheckCountry(
      {required this.title,
      required this.countrycode,
      required this.data,
      required this.validity,
      required this.price});

  @override
  State<CheckCountry> createState() => _CheckCountryState();
}

class _CheckCountryState extends State<CheckCountry> {
  bool checkboxbool = false;

  Color buttoncolor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final prov = Provider.of<Manager_Provider>(context);
    var realdata = prov.packages;

    // Get the list of packages from the provider
    var packages = prov.packages;

    // accessing data for add info
    Data? selectedCountryData = prov.getSelectedCountryData();

    List<Coverages>? coverages =
        selectedCountryData?.operators?.first.coverages;

    String? network = coverages?.isNotEmpty == true
        ? coverages!.first.networks?.first.name ?? ''
        : '';
    String? planType = selectedCountryData?.operators?.first.type ?? '';
    String? activationPolicy =
        selectedCountryData?.operators?.first.activationPolicy ?? '';

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return CountryDetails(
                                      countrycode: widget.countrycode);
                                }));
                              },
                              icon: Icon(Icons.arrow_back)),
                          SizedBox(
                            width: 0.2 * width,
                          ),
                          Text(
                            '${countryNames[widget.countrycode]}',
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff3b57a6)),
                          )
                        ],
                      ),
                      PlanDetails(
                        countrycode: widget.countrycode,
                        name: '${widget.title}',
                        validity: '${widget.validity}',
                        data: '${widget.data}',
                        covrage: countryNames[widget.countrycode]!,
                        checker: false,
                        price: 'help',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Available Packages',
                            style: TextStyle(
                                color: Color(0xff0082d8), fontSize: 15)),
                      ),
                      //carasol slider
                      CarouselSlider(
                        items: realdata?.map((package) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return CheckCountry(
                                      countrycode: widget.countrycode,
                                      title: package.title ?? '',
                                      data: package.data ?? '',
                                      validity: package.day?.toString() ?? '',
                                      price: package.price.toString(),
                                    );
                                  }));
                                },
                                child: PlanDetails(
                                  countrycode: widget.countrycode,
                                  name: package.title ?? '',
                                  validity: package.day?.toString() ?? '',
                                  data: package.data ?? '',
                                  covrage: countryNames[widget.countrycode]!,
                                  checker: false,
                                  price: 'help',
                                ),
                              );
                            }).toList() ??
                            [],
                        options: CarouselOptions(
                          scrollDirection: Axis.horizontal,
                          autoPlay: true,
                          autoPlayAnimationDuration: Duration(seconds: 1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Additional Information:')),
                      ),
                      AddInfo(
                        network: network,
                        plan: planType,
                        policy: activationPolicy,
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
                  child: Center(
                      child: Container(
                    width: 0.8 * width,
                    height: 0.06 * height,
                    decoration: BoxDecoration(
                        color: Color(0xff3b57a6),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      '\$${widget.price}   Buy now',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
