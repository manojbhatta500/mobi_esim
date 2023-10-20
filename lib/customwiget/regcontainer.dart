import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegContainer extends StatelessWidget {
  late String countryname;
  RegContainer({required this.countryname});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 0.1 * height,
      width: 0.9 * width,
      decoration: BoxDecoration(
          color: Color(0xffF4F4F4), borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(image: AssetImage('assets/global.png')),
          Text(
            '$countryname',
            style: TextStyle(color: Color(0xff343434), fontSize: 18),
          ),
          Icon(
            Icons.keyboard_arrow_right_sharp,
            size: 30,
          )
        ],
      ),
    );
  }
}
