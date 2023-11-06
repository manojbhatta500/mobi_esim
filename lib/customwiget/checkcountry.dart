import 'package:flutter/material.dart';
import 'package:mobi_esim/const/util.dart';
import 'package:mobi_esim/customwiget/plandetails.dart';
import 'package:mobi_esim/screens/redirect.dart';

class CheckCountry extends StatefulWidget {
  final String countrycode;
  CheckCountry({required this.countrycode});

  @override
  State<CheckCountry> createState() => _CheckCountryState();
}

class _CheckCountryState extends State<CheckCountry> {
  bool checkboxbool = false;

  Color buttoncolor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: 0.4 * height,
      width: width,
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
                      Navigator.pop(context);
                    },
                    child: Text('cancel'))
              ],
            ),
            PlanDetails(
              countrycode: widget.countrycode,
              validity: '2',
              data: '7',
              covrage: widget.countrycode,
              checker: false,
            ),
            /* Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'Email Address',
                  style: minihead,
                )),
            Container(
              height: 0.07 * height,
              width: 0.9 * width,
              margin: EdgeInsets.only(left: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Email Address',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),*/

            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Redirect();
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
              child: Center(
                  child: Container(
                width: 0.8 * width,
                height: 0.06 * height,
                decoration: BoxDecoration(
                    color: Color(0xff3b57a6),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  '\$5.50   Buy now',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              )),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
