import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/const/util.dart';

class FromCamera extends StatelessWidget {
  const FromCamera({super.key});

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
                  width: 0.1 * width,
                ),
                Text(
                  'User Guide - Android',
                  style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                """ Some devices have the built-in ability to scan QR codes automatically from the gallery. Here’s how to do it on Samsung devices running One UI 3.0 or later:""",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                """Open the Gallery app on your Samsung device.

Navigate to the image of the QR code.

Tap on the image to open it.

A pop-up window should appear at the bottom of the screen, with a button that says “Scan QR code.”

Tap on the “Scan QR code” button, and the device will scan the image and open the link or information encoded in the QR code.

Follow the prompts to install the eSIM and activate it for your device. """,
                style: minihead,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                """The built-in ability to scan QR codes automatically from the gallery on Samsung devices is a feature that was introduced with One UI 3.0, which is based on Android 11. This feature is available on Samsung devices that are running One UI 3.0 or later. """,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                """ However, availability of the feature may also depend on the specific model and variant of the device. For example, some older models may not have received the One UI 3.0 update, and therefore would not have the feature.""",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                """Google Pixel devices running Android 11 or later

Samsung devices running One UI 3.0 or later

OnePlus devices running OxygenOS 11 or later

Xiaomi devices running MIUI 12 or later

Realme devices running Realme UI 2.0 or later """,
                style: minihead,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                """Some of the Samsung devices that are known to support this feature include:""",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                """Samsung Galaxy S21 series

Samsung Galaxy Note 20 series

Samsung Galaxy S20 series

Samsung Galaxy S10 series

Samsung Galaxy Note 10 series

Samsung Galaxy Z Fold 2

Samsung Galaxy Z Flip 5G

Samsung Galaxy A52 5G """,
                style: minihead,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                """
 This is not an exhaustive list and other devices may also support this feature, but it’s best to check the specific deviceand software version to confirm if it is supported or not. Please keep in mind that the feature may not be available on all Samsung devices, and also, the device must be updated to the test software version to support this feature. """,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}
