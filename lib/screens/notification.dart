import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/const/util.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Notifications',
              style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
            ),
            SizedBox(
              width: 0.20 * width,
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  color: Color(0xff3b57a6),
                )),
          ],
        ),
        SizedBox(
          height: 0.4 * height,
        ),
        Center(
          child: Text(
            'You do not have any notifications yet',
            style: minihead,
          ),
        )
      ],
    )));
  }
}
