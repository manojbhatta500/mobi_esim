import 'package:flutter/material.dart';
import 'package:mobi_esim/const/util.dart';
import 'package:mobi_esim/models/guide.dart';

class IosGuide extends StatefulWidget {
  const IosGuide({super.key});

  @override
  State<IosGuide> createState() => _IosGuideState();
}

class _IosGuideState extends State<IosGuide> {
  List<Guide> changer = [
    Guide(
        image: 'assets/apple/ios1.png',
        step: 1,
        text:
            "Talk to your Team of Experts to set up your postpaid plan. You will need to provide your device EID to the Expert to update your account. A QR code is only needed if the auto-discovery notification is not received and will be delivered to you via email for activation. To learn how to access your QR code scanner and add your new line, follow these steps:"),
    Guide(
        image: 'assets/apple/ios2.gif',
        step: 2,
        text: "Go to the Home screen. Choose Settings."),
    Guide(
        image: 'assets/apple/ios3.gif',
        step: 3,
        text: "Scroll down. Choose Cellular."),
    Guide(
        image: 'assets/apple/ios4.gif',
        step: 4,
        text: "Choose Add Cellular Plan."),
    Guide(
        image: 'assets/apple/ios5.png',
        step: 5,
        text:
            "Scan the QR code sent to you via email by your Team of Experts."),
    Guide(
        image: 'assets/apple/ios6.gif',
        step: 6,
        text: "Choose Add Cellular Plan."),
    Guide(image: 'assets/apple/ios7.gif', step: 7, text: "Choose Continue."),
    Guide(
        image: 'assets/apple/ios8.gif',
        step: 8,
        text: "Choose an option, in this case, Secondary."),
    Guide(image: 'assets/apple/ios9.gif', step: 9, text: "Choose Continue."),
    Guide(
        image: 'assets/apple/ios10.gif',
        step: 10,
        text: "Choose an option, in this case, Secondary."),
    Guide(image: 'assets/apple/ios11.gif', step: 11, text: "Choose Continue."),
    Guide(
        image: 'assets/apple/ios12.gif',
        step: 12,
        text: "Choose an option, in this case, Secondary."),
    Guide(
        image: 'assets/apple/ios13.gif',
        step: 13,
        text: "Optional: Turn on Allow Cellular Data Switching. Choose Done."),
    Guide(
        image: 'assets/apple/ios14.png',
        step: 14,
        text:
            "You have scanned your QR code and added your postpaid plan. Return to the Home screen."),
    Guide(
        image: 'assets/apple/ios15.png',
        step: 15,
        text:
            "Your phone and apps may use data when you are not aware of it. You are responsible for any data charges on other wireless networks. To turn off data roaming when you are not on the network, follow these steps:"),
    Guide(
        image: 'assets/apple/ios16.gif',
        step: 16,
        text: "Go to the Home screen. Choose Settings."),
    Guide(
        image: 'assets/apple/ios17.gif',
        step: 17,
        text: "Scroll down. Choose Cellular."),
    Guide(
        image: 'assets/apple/ios18.gif',
        step: 18,
        text: "Choose Cellular Data Options."),
    Guide(
        image: 'assets/apple/ios19.gif',
        step: 19,
        text: "Turn on Data Roaming."),
    Guide(
        image: 'assets/apple/ios20.gif',
        step: 20,
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
                'User Guide - Ios',
                style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
              )
            ],
          ),
          SizedBox(
            height: 0.1 * height,
          ),
          Text(
            'How To Setup Your eSIM On Ios',
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
