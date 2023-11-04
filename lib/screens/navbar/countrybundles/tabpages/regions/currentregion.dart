import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/topcontainer.dart';

class CurrentRegion extends StatelessWidget {
  String continent;

  CurrentRegion({required this.continent});

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
                  width: 0.2 * width,
                ),
                Text(
                  '$continent',
                  style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
                )
              ],
            ),
            TopContainer(),
            TopContainer()
          ],
        ),
      ),
    ));
  }
}
