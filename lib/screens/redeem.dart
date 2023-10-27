import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/const/util.dart';
import 'package:mobi_esim/screens/hurray.dart';

class Redeem extends StatefulWidget {
  const Redeem({super.key});

  @override
  State<Redeem> createState() => _RedeemState();
}

class _RedeemState extends State<Redeem> {
  void screenchanger(BuildContext context) async {
    await Future.delayed(Duration(seconds: 4));
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Hurray();
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
  }

  @override
  void initState() {
    super.initState();
    screenchanger(context);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 0.4 * height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Please Wait',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 0.01 * height,
              ),
              Center(
                child: Text(
                  'Redeeming voucher is in progress',
                  style: minihead,
                ),
              ),
              SizedBox(
                height: 0.1 * height,
              ),
            ]),
      ),
    );
  }
}
