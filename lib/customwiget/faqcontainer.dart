import 'package:flutter/material.dart';

class FaqContainer extends StatelessWidget {
  final String text;

  FaqContainer({required this.text});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 0.1 * height,
      width: 0.9 * width,
      decoration: BoxDecoration(
          color: Color(0xffF4F4F4), borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$text',
            style: TextStyle(color: Color(0xff343434)),
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
