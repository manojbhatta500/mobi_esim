import 'package:flutter/cupertino.dart';
import 'package:mobi_esim/const/util.dart';
import 'package:flutter/material.dart';

class Hurray extends StatefulWidget {
  const Hurray({super.key});

  @override
  State<Hurray> createState() => _HurrayState();
}

class _HurrayState extends State<Hurray> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: 0.5 * height,
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
                  'Hurray! ',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 0.01 * height,
              ),
              Center(
                child: Text(
                  'Voucher was redeemed successfully.',
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
