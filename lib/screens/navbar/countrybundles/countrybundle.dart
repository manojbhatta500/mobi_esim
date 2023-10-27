import 'package:flutter/material.dart';
import 'package:mobi_esim/screens/navbar/countrybundles/tabpages/global.dart';

import 'package:mobi_esim/screens/navbar/countrybundles/tabpages/countrylist.dart';
import 'package:mobi_esim/screens/navbar/countrybundles/tabpages/regions.dart';

class CountryBundle extends StatefulWidget {
  const CountryBundle({super.key});

  @override
  State<CountryBundle> createState() => _CountryBundleState();
}

class _CountryBundleState extends State<CountryBundle>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('hello');
          },
          child: Image.asset(
            'assets/fab.png',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.03 * height,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Let’s Explore!",
                      style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/notifications');
                        },
                        icon: Icon(
                          Icons.notifications,
                          color: Color(0xff3b57a6),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
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
                      hintText: 'Explore multiple countries',
                      contentPadding: EdgeInsets.symmetric(vertical: 6),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
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
                          width: 0.25 * width,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color(0xff2941b8ea),
                              borderRadius: BorderRadius.circular(25)),
                          child: Tab(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                'country',
                                style: TextStyle(color: Color(0xff41b8ea)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 0.06 * height,
                          width: 0.25 * width,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color(0xff2941b8ea),
                              borderRadius: BorderRadius.circular(25)),
                          child: Tab(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                'Region',
                                style: TextStyle(color: Color(0xff41b8ea)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 0.06 * height,
                          width: 0.25 * width,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color(0xff2941b8ea),
                              borderRadius: BorderRadius.circular(25)),
                          child: Tab(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                'Global',
                                style: TextStyle(color: Color(0xff41b8ea)),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              Container(
                height: 0.7 * height,
                width: double.infinity,
                child: TabBarView(
                    controller: controller,
                    children: [CountryList(), Regions(), Global()]),
              )
            ],
          ),
        ),
      ),
    );
  }
}