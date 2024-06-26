import 'package:country_flags/country_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/countrydetails.dart';
import 'package:mobi_esim/customwiget/plandetails.dart';
import 'package:mobi_esim/screens/fullplan/fullbuy.dart';

class FullPlanDetails extends StatelessWidget {
  final String validity;
  final String data;
  final String covrage;
  final String countrycode;
  final String minutes;
  final String texts;
  final bool checker;

  FullPlanDetails(
      {required this.countrycode,
      required this.validity,
      required this.data,
      required this.covrage,
      required this.minutes,
      required this.texts,
      required this.checker});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: 0.35 * height,
      width: 0.9 * width,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      decoration: BoxDecoration(
          color: Color(0xff2941b8ea), borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Yes! Go!',
                style: TextStyle(color: Color(0xff0082d8), fontSize: 15),
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white10,
                child: CountryFlag.fromCountryCode(countrycode, width: 60),
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
                    'Data',
                    style: TextStyle(color: Color(0xff464343), fontSize: 14),
                  ),
                ],
              ),
              Text(
                '$data GB',
                style: TextStyle(color: Color(0xff39393c), fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.call),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'calls',
                    style: TextStyle(color: Color(0xff464343), fontSize: 14),
                  ),
                ],
              ),
              Text(
                '$minutes mins',
                style: TextStyle(color: Color(0xff39393c), fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.message),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Texts',
                    style: TextStyle(color: Color(0xff464343), fontSize: 14),
                  ),
                ],
              ),
              Text(
                '$texts Sms',
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
              Text(
                '${countryNames[countrycode]!}',
                style: TextStyle(color: Color(0xff39393c), fontSize: 14),
              ),
            ],
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FullBuy(
                      countrycode: countrycode,
                      validity: validity,
                      data: data,
                      covrage: covrage,
                      minutes: minutes,
                      texts: texts);
                }));
              },
              child: checker
                  ? FixContainer(
                      price: 'help',
                    )
                  : Container(
                      child: SizedBox(),
                    ))
        ],
      ),
    );
  }
}
