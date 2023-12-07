import 'package:flutter/material.dart';
import 'package:mobi_esim/const/util.dart';
import 'package:mobi_esim/providers/manager_provider.dart';
import 'package:mobi_esim/screens/signup/term&con.dart';
import 'package:mobi_esim/services/apis/manager.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Manager m1 = Manager();
  bool checkboxbool = false;
  Color buttoncolor = Colors.grey;

  TextEditingController email_input = TextEditingController();

  Future<void> register(String email) async {
    try {
      final response = await m1.RegisterUSer(email);

      // Print the response from RegisterUSer
      print('Registration response: $response');
      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      // Navigate to the next screen
      Navigator.pushNamed(context, '/verify');
    } catch (e) {
      print('Registration failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration failed. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final prov = Provider.of<Manager_Provider>(context);
    var bro = prov.email;
    print('this is initital email $bro');

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/navigate');
                  },
                  icon: Icon(Icons.close)),
              Container(
                  height: 0.3 * height,
                  width: width,
                  margin: EdgeInsets.symmetric(horizontal: 0.2 * width),
                  child: Image(image: AssetImage('assets/real.png'))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: welcomecolor,
                  ),
                  SizedBox(
                    width: 0.03 * width,
                  ),
                  Text(
                    'on Board',
                    style: onboard,
                  ),
                ],
              ),
              SizedBox(
                height: 0.02 * height,
              ),
              Center(
                  child: Text(
                'Sign in / Sign up',
                style: minihead,
              )),
              SizedBox(
                height: 0.07 * height,
              ),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Email Address',
                    style: minihead,
                  )),
              SizedBox(
                height: 0.02 * height,
              ),
              Container(
                height: 0.07 * height,
                width: 0.9 * width,
                margin: EdgeInsets.only(left: 20),
                child: TextField(
                  controller: email_input,
                  decoration: InputDecoration(
                      hintText: 'Email Address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              SizedBox(
                height: 0.03 * height,
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                        value: checkboxbool,
                        onChanged: (value) {
                          setState(() {
                            checkboxbool = value!;
                            if (checkboxbool == true) {
                              buttoncolor =
                                  const Color.fromARGB(255, 10, 99, 172);
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return TcScreen();
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                isScrollControlled: true,
                              ).then((value) {
                                print('dismissed bottom modal sheet');
                              });
                            } else {
                              buttoncolor = Colors.grey;
                            }
                          });
                        }),
                    Text(
                      'I accept the ',
                      style: onboard2,
                    ),
                    Text(
                      'Terms and Conditions.',
                      style: welcomecolor2,
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (checkboxbool == true) {
                    register(email_input.text);
                    prov.setemail(email_input.text);
                    print('updated email is  ${prov.email}');
                  } else {
                    print('this is a demo');
                  }
                },
                child: Center(
                  child: Container(
                    height: 0.07 * height,
                    width: 0.9 * width,
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: buttoncolor),
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
