import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/add_info.dart';
import 'package:mobi_esim/customwiget/countrydetails.dart';
import 'package:mobi_esim/customwiget/fullplandetails.dart';

import 'package:mobi_esim/screens/redirect.dart';

class FullBuy extends StatefulWidget {
  FullBuy({
    required this.countrycode,
    required this.validity,
    required this.data,
    required this.covrage,
    required this.minutes,
    required this.texts,
  });

  final String validity;
  final String data;
  final String covrage;
  final String countrycode;
  final String minutes;
  final String texts;

  @override
  State<FullBuy> createState() => _FullBuyState();
}

class _FullBuyState extends State<FullBuy> {
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
                      FullPlanDetails(
                          countrycode: widget.countrycode,
                          validity: widget.validity,
                          data: widget.data,
                          covrage: widget.covrage,
                          minutes: widget.minutes,
                          texts: widget.texts,
                          checker: false),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Available Packages',
                            style: TextStyle(
                                color: Color(0xff0082d8), fontSize: 15)),
                      ),
                      CarouselSlider(
                          items: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return FullBuy(
                                    countrycode: widget.countrycode,
                                    validity: '2',
                                    data: '7',
                                    covrage: widget.countrycode,
                                    minutes: '10',
                                    texts: '10',
                                  );
                                }));
                              },
                              child: FullPlanDetails(
                                countrycode: widget.countrycode,
                                validity: '2',
                                data: '7',
                                covrage: widget.countrycode,
                                minutes: '10',
                                texts: '10',
                                checker: false,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return FullBuy(
                                    countrycode: widget.countrycode,
                                    validity: '10',
                                    data: '15',
                                    covrage: widget.countrycode,
                                    minutes: '100',
                                    texts: '100',
                                  );
                                }));
                              },
                              child: FullPlanDetails(
                                countrycode: widget.countrycode,
                                validity: '10',
                                data: '15',
                                covrage: widget.countrycode,
                                minutes: '100',
                                texts: '100',
                                checker: false,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return FullBuy(
                                    countrycode: widget.countrycode,
                                    validity: '30',
                                    data: '30',
                                    covrage: widget.countrycode,
                                    minutes: '300',
                                    texts: '300',
                                  );
                                }));
                              },
                              child: FullPlanDetails(
                                countrycode: widget.countrycode,
                                validity: '30',
                                data: '30',
                                covrage: widget.countrycode,
                                minutes: '300',
                                texts: '300',
                                checker: false,
                              ),
                            ),
                          ],
                          options: CarouselOptions(
                              scrollDirection: Axis.horizontal,
                              autoPlay: true,
                              autoPlayAnimationDuration: Duration(seconds: 1))),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Additional Information:')),
                      ),
                      AddInfo(),
                    ],
                  ),
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
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
