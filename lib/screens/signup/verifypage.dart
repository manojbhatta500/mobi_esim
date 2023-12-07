import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobi_esim/providers/manager_provider.dart';
import 'package:mobi_esim/services/apis/manager.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Verify extends StatefulWidget {
  Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  Manager m1 = Manager();

  late Timer _resendCodeTimer;
  late int _remainingSeconds;

  String enteredotp = '';

  @override
  void initState() {
    super.initState();

    _remainingSeconds = 101;
    _startResendCodeTimer();
  }

  void _startResendCodeTimer() {
    _resendCodeTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _remainingSeconds = 101 - timer.tick;
      });

      if (_remainingSeconds <= 0) {
        // Timer expired, you can perform additional logic here if needed
        timer.cancel();
      }
    });
  }

  Map<String, dynamic> registrationResponse = {};

  Future<void> verify(String email, String otp) async {
    http.Response response = await m1.VerifyEmail(email, otp);
    print('StatusCode${response.statusCode}');
    print('body${response.body}');

    if (response.statusCode == 200) {
      registrationResponse = jsonDecode(response.body);
      print('this is token: ${registrationResponse['token']}');
      print('this is userid: ${registrationResponse['userid']}');
      print('this is type: ${registrationResponse['type']}');

      Navigator.pushNamed(context, '/welcome');
    } else {
      Navigator.pushNamed(context, '/failed');
    }
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _resendCodeTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final prov = Provider.of<Manager_Provider>(context);

    void showSnackbar(BuildContext context, String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: Duration(seconds: 3), // Adjust the duration as needed
        ),
      );
    }

    Future<void> verify(String email, String otp) async {
      http.Response response = await m1.VerifyEmail(email, otp);
      print('StatusCode${response.statusCode}');
      print('body${response.body}');

      if (response.statusCode == 200) {
        registrationResponse = jsonDecode(response.body);
        print('this is token: ${registrationResponse['token']}');
        print('this is userid: ${registrationResponse['userid']}');
        print('this is type: ${registrationResponse['type']}');
        prov.setUserData('${registrationResponse['token']}',
            '${registrationResponse['userid']}');

        print('this is  provider code');
        print('this is  provider token');
        print('${prov.token}');
        print('this is  provider userid');
        print('${prov.userid}');

        Navigator.pushNamed(context, '/welcome');
      } else {
        Navigator.pushNamed(context, '/failed');
      }
    }

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff3b57a6),
                    )),
                SizedBox(
                  width: 0.2 * width,
                ),
                Center(
                  child: Text(
                    'Verification Code',
                    style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
                  ),
                )
              ],
            ),
            Container(
                height: 0.3 * height,
                width: width,
                margin: EdgeInsets.symmetric(horizontal: 0.2 * width),
                child: Image(image: AssetImage('assets/real.png'))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Please verify',
                  style: TextStyle(fontSize: 16, color: Color(0xff3b57a6)),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('your email!',
                    style: TextStyle(fontSize: 16, color: Color(0xff464343)))
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "You're almost there! An email with a verification code and additional instructions was sent to your email ",
                      style: TextStyle(
                        color: Colors.black, // Your desired style for this part
                        fontSize: 15,
                      ),
                    ),
                    TextSpan(
                      text: "${prov.email}",
                      style: TextStyle(
                        color: Color(
                            0xff464343), // Your desired style for the email
                        fontSize: 15,
                        fontWeight: FontWeight
                            .bold, // You can add other styles as needed
                      ),
                    ),
                    TextSpan(
                      text:
                          " If you did not receive the email, you may need to check your Spam folder.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              padding: const EdgeInsets.all(8.0),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.none,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(20),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeColor: Colors.white),
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: false,
                onCompleted: (v) {
                  setState(() {
                    enteredotp = v;
                    print('otp : $enteredotp');
                    print('v value : $v');
                  });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");

                  return true;
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                print('entered otp : $enteredotp');
                verify('${prov.email}', '${enteredotp.toString()}');
              },
              child: Container(
                height: 0.07 * height,
                width: 0.7 * width,
                child: Center(
                  child: Text(
                    'Verify',
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
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: 0.2 * width, vertical: 10),
              child: Row(
                children: [
                  Text("Didn’t receive a code? ",
                      style: TextStyle(color: Color(0xff817a7a), fontSize: 16)),
                  GestureDetector(
                    onTap: () {
                      if (_resendCodeTimer.isActive) {
                        // Timer is still active, show a message or disable the button
                        showSnackbar(
                            context, "Please wait for the timer to expire.");
                      } else {
                        // Start the timer and trigger the resend code logic
                        _resendCodeTimer = Timer(Duration(seconds: 101), () {
                          m1.RegisterUSer('${prov.email}');
                          showSnackbar(context, "Verification code resent!");
                        });
                      }
                    },
                    child: Text("Resend now",
                        style:
                            TextStyle(color: Color(0xff41b8ea), fontSize: 14)),
                  )
                ],
              ),
            ),
            Center(
              child: Container(
                width: 0.8 * width,
                margin: EdgeInsets.symmetric(
                    horizontal: 0.25 * width, vertical: 10),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Text("Time Remaining: ",
                          style: TextStyle(
                              color: Color(0xff817a7a), fontSize: 14)),
                      Text("$_remainingSeconds seconds. ",
                          style:
                              TextStyle(color: Color(0xff41b8ea), fontSize: 14))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
