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
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Color(0xff3b57a6),
                    )),
              ],
              title: Center(
                child: Text(
                  'Notifications',
                  style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
                ),
              ),
            ),
            body: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
              ),
            )));
  }
}
