import 'package:country_flags/country_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlanDetails extends StatelessWidget {
  final String validity;
  final String data;
  final String covrage;
  final String countrycode;
  final bool checker;
  final String price;
  final String name;
  final bool istopuo;
  PlanDetails(
      {required this.countrycode,
      required this.name,
      required this.validity,
      required this.data,
      required this.covrage,
      required this.checker,
      required this.price,
      required this.istopuo});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String removeAfterFirstDash(String text) {
      if (text.contains("-")) {
        return text.substring(0, text.indexOf("-"));
      } else {
        return text;
      }
    }

    String result = removeAfterFirstDash(name);

    String capitalize(String s) {
      return s.isNotEmpty ? s[0].toUpperCase() + s.substring(1) : s;
    }

    String capitalizedResult = capitalize(result);

    return Container(
      height: 0.28 * height,
      width: 0.9 * width,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
          color: Color(0xff2941b8ea), borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          istopuo
              ? SizedBox(
                  height: 1,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$capitalizedResult',
                      style: TextStyle(color: Color(0xff0082d8), fontSize: 15),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white10,
                      child:
                          CountryFlag.fromCountryCode(countrycode, width: 60),
                    ),
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
              Text(
                '$covrage',
                style: TextStyle(color: Color(0xff39393c), fontSize: 14),
              ),
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
                '$validity Days',
                style: TextStyle(color: Color(0xff39393c), fontSize: 14),
              ),
            ],
          ),
          checker
              ? FixContainer(
                  price: price,
                )
              : Container()
        ],
      ),
    );
  }
}

class FixContainer extends StatelessWidget {
  const FixContainer({super.key, required this.price});
  final String price;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: 0.8 * width,
      height: 0.06 * height,
      decoration: BoxDecoration(
          color: Color(0xff3b57a6), borderRadius: BorderRadius.circular(20)),
      child: Center(
          child: Text(
        '\$${price} Buy Now',
        style: TextStyle(color: Colors.white, fontSize: 20),
      )),
    );
  }
}
