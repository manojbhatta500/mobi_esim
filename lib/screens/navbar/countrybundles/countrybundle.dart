import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/logbutton.dart';
import 'package:mobi_esim/providers/manager_provider.dart';
import 'package:mobi_esim/screens/navbar/countrybundles/tabpages/global.dart';
import 'package:mobi_esim/screens/navbar/countrybundles/tabpages/countrylist.dart';
import 'package:mobi_esim/screens/navbar/countrybundles/tabpages/regions.dart';
import 'package:provider/provider.dart';

class CountryBundle extends StatefulWidget {
  const CountryBundle({super.key});

  @override
  State<CountryBundle> createState() => _CountryBundleState();
}

class _CountryBundleState extends State<CountryBundle>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  TextEditingController inputcountry = TextEditingController();

  String currentSearch = '';

  String token = '';
  String userid = '';

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  void updateSearchResults(String query) {
    setState(() {
      currentSearch = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final prov = Provider.of<Manager_Provider>(context);

    void getdata() async {
      var hive_userid = await prov.getUserId();
      var hive_token = await prov.getUserToken();
      token = hive_token;
      userid = hive_userid;
      print('Hive token value: $hive_token');
      print('Hive userid value: $hive_userid');
      print('local token value: $token');
      print('local userid value: $userid');
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('hello');

            getdata();
          },
          child: Image.asset(
            'assets/fab.png',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      "Let's Explore!",
                      style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
                    ),
                    prov.show
                        ? LogButton()
                        : Container(
                            child: Text(''),
                          )
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
                  controller: inputcountry,
                  onChanged: updateSearchResults,
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
                width: 1 * width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TabBar(
                      controller: controller,
                      isScrollable: true,
                      indicator: null,
                      tabs: [
                        Container(
                          height: 0.06 * height,
                          width: 0.22 * width,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color(0xff2941b8ea),
                              borderRadius: BorderRadius.circular(10)),
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
                          width: 0.22 * width,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color(0xff2941b8ea),
                              borderRadius: BorderRadius.circular(10)),
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
                          width: 0.22 * width,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color(0xff2941b8ea),
                              borderRadius: BorderRadius.circular(10)),
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
                height: 0.62 * height,
                width: double.infinity,
                child: TabBarView(
                  controller: controller,
                  children: [
                    CountryList(searchQuery: currentSearch),
                    Regions(),
                    Global(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
