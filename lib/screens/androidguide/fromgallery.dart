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
        image: 'assets/guide.png',
        step: 1,
        text:
            'A QR code will be delivered to you via email for activation. To learn how to access your QR code scanner and add your new line, follow these steps.'),
    Guide(
        image: 'assets/guide.png',
        step: 2,
        text:
            'Go to the Home screen. To open the menu, swipe up on the screen.'),
    Guide(
        image: 'assets/guide.png',
        step: 3,
        text: 'scroll to right and choose settings'),
    Guide(
        image: 'assets/guide.png',
        step: 4,
        text: 'scroll down and choose connections'),
    Guide(image: 'assets/guide.png', step: 5, text: 'choose sim card manager'),
    Guide(image: 'assets/guide.png', step: 6, text: 'choose add mobile plan'),
    Guide(
        image: 'assets/guide.png',
        step: 7,
        text: 'choose scan carrier qr code'),
    Guide(
        image: 'assets/guide.png',
        step: 8,
        text: 'point the camera at the code'),
    Guide(image: 'assets/guide.png', step: 9, text: 'choose confirm'),
    Guide(
        image: 'assets/guide.png',
        step: 10,
        text: 'the esim is being downloaded it will take some time '),
    Guide(image: 'assets/guide.png', step: 11, text: 'choose option '),
    Guide(image: 'assets/guide.png', step: 12, text: 'enjoy your data '),
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
