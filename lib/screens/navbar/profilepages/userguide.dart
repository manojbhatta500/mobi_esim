import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/const/util.dart';
import 'package:mobi_esim/customwiget/profile_menu.dart';

class UserGuide extends StatefulWidget {
  const UserGuide({super.key});

  @override
  State<UserGuide> createState() => _UserGuideState();
}

class _UserGuideState extends State<UserGuide> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff3b57a6),
                    )),
                SizedBox(
                  width: 0.25 * width,
                ),
                Text(
                  'User Guide',
                  style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
                )
              ],
            ),
            Container(
              height: 0.9 * height,
              width: width,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 0.1 * height,
                  ),
                  Text(
                    'Download an eSIM to the device using a QR code',
                    style: minihead,
                  ),
                  SizedBox(
                    height: 0.1 * height,
                  ),
                  Text('Select your device'),
                  SizedBox(
                    height: 0.05 * height,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/andguide');
                      },
                      child: ProfileMenu(
                          geticon: Icons.android, heading: 'Android')),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/iosguide');
                      },
                      child:
                          ProfileMenu(geticon: Icons.ios_share, heading: 'Ios'))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
