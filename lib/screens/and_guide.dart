import 'package:flutter/material.dart';

import 'package:mobi_esim/customwiget/profile_menu.dart';
import 'package:mobi_esim/screens/androidguide/fromcamera.dart';
import 'package:mobi_esim/screens/androidguide/fromgallery.dart';

class AndGuide extends StatefulWidget {
  const AndGuide({super.key});

  @override
  State<AndGuide> createState() => _AndGuideState();
}

class _AndGuideState extends State<AndGuide> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  width: 0.1 * width,
                ),
                Text(
                  'User Guide - Android',
                  style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
                )
              ],
            ),
            SizedBox(
              height: 0.05 * height,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Select a method according to your device ability'),
            ),
            SizedBox(
              height: 0.1 * height,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FromCamera();
                }));
              },
              child: ProfileMenu(
                  geticon: Icons.camera, heading: 'Scan Code From Camera'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FromGallery();
                }));
              },
              child: ProfileMenu(
                  geticon: Icons.browse_gallery,
                  heading: 'Scan Code From Gallery'),
            )
          ],
        ),
      ),
    ));
  }
}
/*
SizedBox(
              height: 0.1 * height,
            ),
            Text(
              'Step 1',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'A QR code will be delivered to you via email for activation. To learn how to access your QR code scanner and add your new line, follow these steps.',
                style: minihead,
              ),
            ),
            SizedBox(
              height: 0.1 * height,
            ),
            Text(
              'Step 2',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Go to the Home screen. To open the menu, swipe up on the screen.',
                style: minihead,
              ),
            ),
            SizedBox(
              height: 0.1 * height,
            ),
            Text(
              'Step 3',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Go to the Cellular/Mobile network settings of your eSIM capable device and follow the instructions to Add Cellular Plan / Add Mobile Network.',
                style: minihead,
              ),
            ),
            SizedBox(
              height: 0.1 * height,
            ),
            Text(
              'Step 4',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Disconnect WiFi and wait for a few minutes to allow the eSIM to set itself up correctly.If your eSIM is not connecting to a network, please ensure that Cellular/Mobile Data is assigned to your eSIM and Data Roaming is turned ON.If you are connected a network but data connection is not working as expected, please check if APN is mentioned in your eSIM profile information. If yes, please set the correct APN for your eSIM. Toggle Airplane mode ON and OFF and check the connection again.',
                style: minihead,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            */