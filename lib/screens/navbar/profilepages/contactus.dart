import 'package:flutter/material.dart';
import 'package:mobi_esim/const/util.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  width: 0.25 * width,
                ),
                Text(
                  'Contact Us',
                  style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " Please email us using the form below or contact us via whatsapp",
                    style: TextStyle(color: Color(0xffb9b9b9)),
                  ),
                  SizedBox(
                    height: 0.02 * height,
                  ),
                  Text(
                    'Email Address',
                    style: minihead,
                  ),
                  SizedBox(
                    height: 0.02 * height,
                  ),
                  Container(
                    height: 0.07 * height,
                    width: 0.9 * width,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'jondoe@gmail.com',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  SizedBox(
                    height: 0.02 * height,
                  ),
                  Text(
                    'How can we help?',
                    style: minihead,
                  ),
                  SizedBox(
                    height: 0.02 * height,
                  ),
                  TextFormField(
                    minLines: 6,
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 0.02 * height,
                  ),
                  Container(
                    height: 0.07 * height,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Submit now ',
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
                  SizedBox(
                    height: 0.02 * height,
                  ),
                  Center(
                    child: Text(
                      'OR',
                      style: minihead,
                    ),
                  ),
                  SizedBox(
                    height: 0.02 * height,
                  ),
                  Container(
                    height: 0.07 * height,
                    width: double.infinity,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.email,
                            size: 20,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Whatsapp ',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
