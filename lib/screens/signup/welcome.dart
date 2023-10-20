import 'package:flutter/material.dart';
import 'package:mobi_esim/screens/navigate.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  void screenchanger(BuildContext context) async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Navigate()));
  }

  @override
  void initState() {
    super.initState();
    screenchanger(context);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: double.infinity,
        color: Color(0xff8019191c),
        child: Center(
            child: Container(
          height: 0.3 * height,
          width: 0.7 * width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 50,
              ),
              Text(
                'Signed IN!',
                style: TextStyle(
                    color: Color(0xff010101),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome ',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'on Board!',
                    style: TextStyle(
                        color: Color(0xff464343),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
