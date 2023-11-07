import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Verify extends StatelessWidget {
  const Verify({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                      Navigator.pop(context);
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
                      text: "Johndow@gmail.com",
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
                length: 5,
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
                  print("Completed");
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");

                  return true;
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/failed'); //'/welcome'
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
                  EdgeInsets.symmetric(horizontal: 0.15 * width, vertical: 5),
              child: Row(
                children: [
                  Text("Didn’t receive a code? ",
                      style: TextStyle(color: Color(0xff817a7a), fontSize: 16)),
                  Text("Resend now",
                      style: TextStyle(color: Color(0xff41b8ea), fontSize: 14))
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: 0.3 * width, vertical: 10),
              child: Row(
                children: [
                  Text("Time Remaining ",
                      style: TextStyle(color: Color(0xff817a7a), fontSize: 14)),
                  Text("00:58",
                      style: TextStyle(color: Color(0xff41b8ea), fontSize: 14))
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
