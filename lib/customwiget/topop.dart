import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/topcontainer.dart';

class Topop extends StatelessWidget {
  const Topop({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: 0.9 * height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {
                      print('printed cancel button');
                      Navigator.pop(context);
                    },
                    child: Text('Cancel')),
                SizedBox(
                  width: 0.25 * width,
                ),
                Text(
                  'Top-up',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
            Divider(),
            TopContainer(),
            TopContainer(),
            TopContainer(),
          ],
        ),
      ),
    );
  }
}
