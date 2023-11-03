import 'package:flutter/material.dart';

class FailedSignin extends StatefulWidget {
  const FailedSignin({super.key});

  @override
  State<FailedSignin> createState() => _FailedSigninState();
}

class _FailedSigninState extends State<FailedSignin> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: double.infinity,
          color: Color(0xff8019191c),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.3 * height,
              ),
              Center(
                  child: Container(
                height: 0.25 * height,
                width: 0.8 * width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.cancel,
                      color: Colors.red,
                      size: 70,
                    ),
                    Text(
                      'Failed To Signed IN!',
                      style: TextStyle(
                          color: Color(0xff010101),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Link Is Broken ',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                ),
              )),
              SizedBox(
                height: 0.2 * height,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/welcome');
                },
                child: Container(
                  height: 0.06 * height,
                  width: 0.8 * width,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Resend Link',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          wordSpacing: 3,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
