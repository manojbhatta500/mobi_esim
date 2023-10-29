import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/const/util.dart';
import 'package:mobi_esim/models/guide.dart';

class FromGallery extends StatefulWidget {
  const FromGallery({super.key});

  @override
  State<FromGallery> createState() => _FromGalleryState();
}

class _FromGalleryState extends State<FromGallery> {
  List<Guide> changer = [
    Guide(
        image: 'assets/and/step1.png',
        step: 1,
        text:
            "Talk to your Team of Experts to set up your postpaid plan. You will need to provide your device EID to the Expert to update your account. A QR code will be delivered to you via email for activation. To learn how to access your QR code scanner and add your new line, follow these steps:"),
    Guide(
        image: 'assets/and/step2.png',
        step: 2,
        text:
            "Go to the Home screen. To open the menu, swipe up on the screen."),
    Guide(
        image: 'assets/and/step3.gif',
        step: 3,
        text: "Scroll to the right. Choose Settings."),
    Guide(
        image: 'assets/and/step4.gif',
        step: 4,
        text: 'scroll down and choose connections'),
    Guide(
        image: 'assets/and/step5.gif',
        step: 5,
        text: 'choose sim card manager'),
    Guide(
        image: 'assets/and/step6.gif',
        step: 6,
        text: "Under eSIMs, choose Add mobile plan."),
    Guide(
        image: 'assets/and/step7.gif',
        step: 7,
        text: "Choose Scan carrier QR code."),
    Guide(
        image: 'assets/and/step8.png',
        step: 8,
        text: "To scan a QR code, point the camera at the code."),
    Guide(image: 'assets/and/step9.gif', step: 9, text: 'choose confirm'),
    Guide(
        image: 'assets/and/step10.png',
        step: 10,
        text:
            "The eSIM profile is being downloaded. This can take up to 5 minutes."),
    Guide(
        image: 'assets/and/step11.gif',
        step: 11,
        text:
            "You have scanned your QR code and added your postpaid plan. Return to the Home screen."),
    Guide(
        image: 'assets/and/step12.png',
        step: 12,
        text:
            "Your phone and apps may use data when you are not aware of it. You are responsible for any data charges on other wireless networks. To turn off data roaming when you are not on the network, follow these steps:"),
    Guide(
        image: 'assets/and/step13.png',
        step: 13,
        text:
            "Go to the Home screen. To open the menu, swipe up on the screen."),
    Guide(
        image: 'assets/and/step14.gif',
        step: 14,
        text: "Scroll to the right. Choose Settings."),
    Guide(
        image: 'assets/and/step15.gif',
        step: 15,
        text: "Scroll down. Choose Connections."),
    Guide(
        image: 'assets/and/step16.gif',
        step: 16,
        text: "Choose Mobile networks."),
    Guide(
        image: 'assets/and/step17.gif',
        step: 17,
        text: "Turn on Data roaming."),
    Guide(
        image: 'assets/and/step18.gif',
        step: 18,
        text: "Data roaming has been turned on. Return to the Home screen."),
  ];
  int index = 0;

  void increment() {
    print(changer.length);
    if (index == changer.length - 1) {
      print("sorry it's max");
    } else {
      setState(() {
        index = index + 1;
      });
    }
  }

  void decrement() {
    print(changer.length);
    if (index == 0) {
      print("sorry it's max");
    } else {
      setState(() {
        index = index - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(changer.length);

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
            height: 0.1 * height,
          ),
          Text(
            'How To Setup Your eSIM On Android',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 0.1 * height,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: decrement, icon: Icon(Icons.arrow_back_ios)),
              Container(
                  height: 0.3 * height,
                  width: 0.4 * width,
                  child: Image(image: AssetImage('${changer[index].image}'))),
              IconButton(
                  onPressed: increment,
                  icon: Icon(Icons.arrow_forward_ios_outlined)),
            ],
          ),
          SizedBox(
            height: 0.05 * height,
          ),
          Text(
            'Step ${changer[index].step}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 0.05 * height,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '${changer[index].text}',
              style: minihead,
            ),
          )
        ],
      ),
    )));
  }
}
