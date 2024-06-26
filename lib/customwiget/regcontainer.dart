import 'package:flutter/material.dart';

class RegContainer extends StatelessWidget {
  late String countryname;
  late String image;
  RegContainer({required this.countryname, required this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      height: 0.1 * height,
      width: 0.95 * width,
      decoration: BoxDecoration(
          color: Color(0xffF4F4F4), borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              '$image',
              fit:
                  BoxFit.cover, // Use BoxFit.cover to maintain the aspect ratio
            ),
          ),
          Text(
            '$countryname',
            style: TextStyle(color: Color(0xff343434), fontSize: 16),
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
