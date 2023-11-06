import 'package:flutter/material.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                  width: 0.35 * width,
                ),
                Text(
                  'FAQ',
                  style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
                )
              ],
            ),
            SizedBox(
              height: 0.08 * height,
            ),
            Container(
              height: 0.1 * height,
              width: 0.9 * width,
              margin: EdgeInsets.only(left: 10),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF4F4F4),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search ',
                    contentPadding: EdgeInsets.symmetric(vertical: 6),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: ExpansionTile(
                title: Text('When will I receive my e-SIM?'),
                children: [
                  Text(
                      'Call or text your current provider to request a mobile PAC code. A PAC code should begiven to you immediately over the phone orwithin two hours by text')
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: ExpansionTile(
                title: Text('How do I install my e-SIM?'),
                children: [
                  Text(
                      'Call or text your current provider to request a mobile PAC code. A PAC code should begiven to you immediately over the phone orwithin two hours by text')
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: ExpansionTile(
                title: Text('Can I use WhatsApp?'),
                children: [
                  Text(
                      'Call or text your current provider to request a mobile PAC code. A PAC code should begiven to you immediately over the phone orwithin two hours by text')
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: ExpansionTile(
                title: Text('My e-SIM is not connecting?'),
                children: [
                  Text(
                      'Call or text your current provider to request a mobile PAC code. A PAC code should begiven to you immediately over the phone orwithin two hours by text')
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: ExpansionTile(
                title: Text('Can I call & send sms via my e-SIM?'),
                children: [
                  Text(
                      'Call or text your current provider to request a mobile PAC code. A PAC code should begiven to you immediately over the phone orwithin two hours by text')
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
