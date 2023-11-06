import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/topop.dart';

class PlanContainer extends StatelessWidget {
  final String countryname;
  final String continentname;

  PlanContainer({required this.continentname, required this.countryname});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Container(
      height: 0.28 * height,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Color(0xfff0f1fe), borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xff9e9ea3),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '$countryname',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      SizedBox(
                        width: 0.1 * width,
                      ),
                      Text(
                        '$continentname',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Purchased 24-5-2021',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                      Text(
                        'Purchased 24-5-2021',
                        style: TextStyle(fontSize: 9, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Topop();
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            isScrollControlled: true,
                          ).then((value) {
                            print('dismissed bottom modal sheet');
                          });
                        },
                        icon: Icon(CupertinoIcons.forward, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.gas_meter,
                    size: 30,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Consumtions',
                    style: TextStyle(fontSize: 13, color: Colors.blue),
                  )
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons
                        .signal_wifi_statusbar_connected_no_internet_4_outlined,
                    size: 30,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Top up',
                    style: TextStyle(fontSize: 13, color: Colors.blue),
                  )
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.qr_code,
                    size: 30,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'View QR Code',
                    style: TextStyle(fontSize: 13, color: Colors.blue),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
