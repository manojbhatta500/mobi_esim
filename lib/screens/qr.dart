import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 0.01 * height,
              ),
              Text(
                'QR Code Details',
                style: TextStyle(fontSize: 20, color: Color(0xff212121)),
              ),
              SizedBox(
                height: 0.01 * height,
              ),
              Text(
                'The QR code was sent to your email.',
                style: TextStyle(fontSize: 16, color: Color(0xff212121)),
              ),
              SizedBox(
                height: 0.01 * height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Scan the below QR code',
                    style: TextStyle(fontSize: 16, color: Color(0xff212121)),
                  ),
                  IconButton(onPressed: null, icon: Icon(Icons.share))
                ],
              ),
              Container(
                height: 0.5 * height,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xfff6f6f6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 0.01 * height,
                    ),
                    Image(
                        height: 125,
                        width: 125,
                        image: AssetImage(
                          'assets/qr.png',
                        )),
                    Text(
                      'Or the below details manually',
                      style: TextStyle(fontSize: 16, color: Color(0xff212121)),
                    ),
                    SizedBox(
                      height: 0.01 * height,
                    ),
                    Text(
                      'SM-DP+ ADDRESS',
                      style: TextStyle(fontSize: 16, color: Color(0xff212121)),
                    ),
                    Container(
                      height: 0.05 * height,
                      width: 0.7 * width,
                      margin: EdgeInsets.only(left: 20),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'SMDP ADDRESS SMDP ADDRESS',
                            suffixIcon: Icon(CupertinoIcons.info_circle),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 1.0, horizontal: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    SizedBox(
                      height: 0.01 * height,
                    ),
                    Text(
                      'Activation Code',
                      style: TextStyle(fontSize: 16, color: Color(0xff212121)),
                    ),
                    Container(
                      height: 0.05 * height,
                      width: 0.7 * width,
                      margin: EdgeInsets.only(left: 20),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Activation Code',
                            suffixIcon: Icon(CupertinoIcons.info_circle),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 1.0, horizontal: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    SizedBox(
                      height: 0.01 * height,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.01 * height,
              ),
              Text(
                'For more info check User Guide',
                style: TextStyle(fontSize: 14, color: Color(0xff212121)),
              ),
              SizedBox(
                height: 0.01 * height,
              ),
              Center(
                child: Container(
                  height: 0.05 * height,
                  width: 0.7 * width,
                  child: Center(
                    child: Text(
                      'Go To My eSIM',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 0.02 * height,
              ),
              Text(
                'Didn’t receive a QR code? Resend now',
                style: TextStyle(fontSize: 14, color: Color(0xff212121)),
              ),
              SizedBox(
                height: 0.01 * height,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
