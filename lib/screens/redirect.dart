import 'package:flutter/material.dart';
import 'package:mobi_esim/const/util.dart';
import 'package:mobi_esim/providers/manager_provider.dart';
import 'package:mobi_esim/pyscreen.dart';
import 'package:provider/provider.dart';

class Redirect extends StatefulWidget {
  const Redirect({super.key});

  @override
  State<Redirect> createState() => _RedirectState();
}

class _RedirectState extends State<Redirect> {
  void screenchanger(BuildContext context) async {
    await Future.delayed(Duration(seconds: 4));
    print('hello');

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PyScreen();
    }));
  }

  @override
  void initState() {
    super.initState();
    screenchanger(context);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
                  'You’re almost there! ',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 0.01 * height,
              ),
              Center(
                child: Text(
                  'We are redirecting you to our Secure Payment',
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
