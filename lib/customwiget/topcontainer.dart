import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/reg_country.dart';
import 'package:mobi_esim/screens/dataconsumption.dart';
import 'package:mobi_esim/screens/supported_region.dart';

class TopContainer extends StatelessWidget {
  TopContainer({
    super.key,
    required this.coverage,
    required this.image,
    required this.data,
    required this.validity,
    required this.price,
    required this.provider,
  });
  final String coverage;
  final String data;
  final String validity;
  final String price;
  final String? image;
  final String? provider;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        height: 0.3 * height,
        width: 0.9 * width,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
            color: Color(0xff2941b8ea),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$provider',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                Image(
                  image: NetworkImage('$image'),
                  width: 80,
                )
              ],
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
                      style: TextStyle(color: Colors.black, fontSize: 14),
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
                    Icon(
                      Icons.signal_cellular_alt,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Data',
                      style: TextStyle(color: Colors.black, fontSize: 14),
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
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ],
                ),
                Text(
                  '$validity Day',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 0.8 * width,
              height: 0.06 * height,
              decoration: BoxDecoration(
                  color: Color(0xff3b57a6),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Text(
                '\$${price} Buy now',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            )
          ],
        ));
  }
}
