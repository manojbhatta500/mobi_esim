import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/countrydetails.dart';

import 'package:mobi_esim/customwiget/data.dart';
import 'package:mobi_esim/customwiget/plandetails.dart';
import 'package:mobi_esim/screens/redirect.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CheckCountry extends StatefulWidget {
  final String countrycode;
  final String validity;
  final String data;
  CheckCountry(
      {required this.countrycode, required this.data, required this.validity});

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
                      style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
                    )
                  ],
                ),
                PlanDetails(
                  countrycode: widget.countrycode,
                  validity: '${widget.validity}',
                  data: '${widget.data}',
                  covrage: widget.countrycode,
                  checker: false,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Available Packages',
                      style: TextStyle(color: Color(0xff0082d8), fontSize: 15)),
                ),
                CarouselSlider(
                    items: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CheckCountry(
                                countrycode: widget.countrycode,
                                data: '2',
                                validity: '7');
                          }));
                        },
                        child: PlanDetails(
                          countrycode: widget.countrycode,
                          validity: '7',
                          data: '2',
                          covrage: widget.countrycode,
                          checker: false,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CheckCountry(
                                countrycode: widget.countrycode,
                                data: '15',
                                validity: '15');
                          }));
                        },
                        child: PlanDetails(
                          countrycode: widget.countrycode,
                          validity: '15',
                          checker: false,
                          data: '10',
                          covrage: widget.countrycode,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CheckCountry(
                                countrycode: widget.countrycode,
                                data: '30',
                                validity: '30');
                          }));
                        },
                        child: PlanDetails(
                          countrycode: widget.countrycode,
                          validity: '30',
                          checker: false,
                          data: '30',
                          covrage: widget.countrycode,
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        autoPlayAnimationDuration: Duration(seconds: 1))),
                SizedBox(
                  height: 0.1 * height,
                ),
                GestureDetector(
                  onTap: () {
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
                      '\$5.50   Buy now',
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
