import 'package:flutter/material.dart';
import 'package:mobi_esim/informant.dart';
import 'package:mobi_esim/providers/manager_provider.dart';

import 'package:mobi_esim/screens/currentplan.dart';
import 'package:mobi_esim/screens/expiredplan.dart';
import 'package:provider/provider.dart';

class MyEsim extends StatefulWidget {
  const MyEsim({super.key});

  @override
  State<MyEsim> createState() => _MyEsimState();
}

class _MyEsimState extends State<MyEsim> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

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
                SizedBox(
                  width: 0.4 * width,
                ),
                Text(
                  'My eSIM',
                  style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 0.08 * height,
              width: double.infinity,
              child: Center(
                child: TabBar(
                    controller: controller,
                    isScrollable: true,
                    indicator: null,
                    tabs: [
                      Container(
                        height: 0.06 * height,
                        width: 0.4 * width,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xff2941b8ea),
                            borderRadius: BorderRadius.circular(25)),
                        child: Tab(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              'Current plan',
                              style: TextStyle(color: Color(0xff41b8ea)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 0.06 * height,
                        width: 0.4 * width,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xff2941b8ea),
                            borderRadius: BorderRadius.circular(25)),
                        child: Tab(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              'Expired plan',
                              style: TextStyle(color: Color(0xff41b8ea)),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            Container(
              height: 0.75 * height,
              width: double.infinity,
              child: TabBarView(
                  controller: controller,
                  children: [CurrentPlan(), ExpiredPlan()]),
            )
          ],
        ),
      ),
    ));
  }
}
