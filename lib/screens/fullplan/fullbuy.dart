import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/countrydetails.dart';
import 'package:mobi_esim/customwiget/fullplandetails.dart';
import 'package:mobi_esim/screens/navbar/countrybundles/tabpages/countrylist.dart';
import 'package:mobi_esim/screens/redirect.dart';

class FullBuy extends StatelessWidget {
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
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CountryDetails(countrycode: countrycode);
                        }));
                      },
                      icon: Icon(Icons.arrow_back)),
                  SizedBox(
                    width: 0.2 * width,
                  ),
                ],
              ),
              FullPlanDetails(
                  countrycode: countrycode,
                  validity: validity,
                  data: data,
                  covrage: covrage,
                  minutes: minutes,
                  texts: texts,
                  checker: false),
              CarouselSlider(
                  items: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return FullBuy(
                            countrycode: countrycode,
                            validity: '2',
                            data: '7',
                            covrage: countrycode,
                            minutes: '10',
                            texts: '10',
                          );
                        }));
                      },
                      child: FullPlanDetails(
                        countrycode: countrycode,
                        validity: '2',
                        data: '7',
                        covrage: countrycode,
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
                            countrycode: countrycode,
                            validity: '10',
                            data: '15',
                            covrage: countrycode,
                            minutes: '100',
                            texts: '100',
                          );
                        }));
                      },
                      child: FullPlanDetails(
                        countrycode: countrycode,
                        validity: '10',
                        data: '15',
                        covrage: countrycode,
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
                            countrycode: countrycode,
                            validity: '30',
                            data: '30',
                            covrage: countrycode,
                            minutes: '300',
                            texts: '300',
                          );
                        }));
                      },
                      child: FullPlanDetails(
                        countrycode: countrycode,
                        validity: '30',
                        data: '30',
                        covrage: countrycode,
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
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
