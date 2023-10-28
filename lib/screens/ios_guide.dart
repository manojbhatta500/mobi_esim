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
        image: 'assets/iguide.png',
        step: 1,
        text:
            'A QR code will be delivered to you via email for activation. To learn how to access your QR code scanner and add your new line, follow these steps:'),
    Guide(
        image: 'assets/iguide.png',
        step: 2,
        text: 'Go to the Home screen. Choose Settings.'),
    Guide(
        image: 'assets/iguide.png',
        step: 3,
        text: 'scroll down and choose celluar'),
    Guide(image: 'assets/iguide.png', step: 4, text: 'add celluar plan'),
    Guide(image: 'assets/iguide.png', step: 5, text: 'scan qr code via email'),
    Guide(image: 'assets/iguide.png', step: 6, text: 'choose continue'),
    Guide(image: 'assets/iguide.png', step: 7, text: 'choose continue'),
    Guide(
        image: 'assets/iguide.png',
        step: 8,
        text: 'turn on allow cellular data'),
    Guide(image: 'assets/iguide.png', step: 9, text: 'turn on data roaming'),
    Guide(image: 'assets/iguide.png', step: 10, text: 'go to home screen'),
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
