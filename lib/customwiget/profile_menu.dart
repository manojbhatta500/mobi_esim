import 'package:flutter/cupertino.dart';

class ProfileMenu extends StatelessWidget {
  final IconData geticon;
  final String heading;
  ProfileMenu({required this.geticon, required this.heading});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: 0.09 * height,
      width: 0.85 * width,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xffE0F4FC), borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                geticon,
                size: 22,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                '$heading',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              )
            ],
          ),
          Icon(
            CupertinoIcons.arrow_right,
            size: 20,
          )
        ],
      ),
    );
  }
}
