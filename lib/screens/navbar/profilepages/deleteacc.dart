import 'package:flutter/material.dart';

class DeleteAcc extends StatefulWidget {
  const DeleteAcc({super.key});

  @override
  State<DeleteAcc> createState() => _DeleteAccState();
}

class _DeleteAccState extends State<DeleteAcc> {
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
                Text(
                  'Delete My Account',
                  style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
                )
              ],
            ),
            SizedBox(
              height: 0.08 * height,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Text(
                  'We are sorry to see you leave!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.02 * height,
            ),
            Center(
              child: Icon(
                Icons.warning_amber,
                size: 70,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                """ You are about to delete your Monty eSIM account. If you have a problem using the app, you can reach out to us directly at support@montyesim.com To help you solve it.""",
                style: TextStyle(
                    color: Color(0xff3c3c3b),
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 0.05 * height,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Deleting your account will delete all your account information.',
                style: TextStyle(color: Color(0xff3c3c3b), fontSize: 15),
              ),
            ),
            SizedBox(
              height: 0.05 * height,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'To confirm, type:  delete',
                style: TextStyle(color: Color(0xff3c3c3b), fontSize: 14),
              ),
            ),
            SizedBox(
              height: 0.02 * height,
            ),
            Container(
              height: 0.06 * height,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'Delete',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            SizedBox(
              height: 0.05 * height,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/faq');
              },
              child: Container(
                  height: 0.08 * height,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Delete',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )),
            ),
            SizedBox(
              height: 4,
            )
          ],
        ),
      ),
    ));
  }
}
