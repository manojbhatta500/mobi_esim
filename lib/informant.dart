import 'package:flutter/material.dart';

import 'package:mobi_esim/customwiget/logbutton.dart';

class Informant extends StatelessWidget {
  const Informant({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Text("you're not logged in."),
            Container(
              height: 50,
              width: 100,
              child: LogButton(),
            )
          ],
        ),
      ),
    );
  }
}
