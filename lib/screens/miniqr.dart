import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/const/util.dart';
import 'package:mobi_esim/screens/redeem.dart';

class MiniQr extends StatefulWidget {
  const MiniQr({super.key});

  @override
  State<MiniQr> createState() => _MiniQrState();
}

class _MiniQrState extends State<MiniQr> {
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {
                        print('printed cancel button');
                        Navigator.pop(context);
                      },
                      child: Text('Cancel')),
                  SizedBox(
                    width: 0.25 * width,
                  ),
                  Text(
                    'QR Code ',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
              Divider(),
              Center(
                child: Text(
                  'Please scan the QR code to redeem your voucher',
                  style: minihead,
                ),
              ),
              SizedBox(
                height: 0.02 * height,
              ),
              Center(
                child: Image(
                    height: 100,
                    width: 100,
                    image: AssetImage(
                      'assets/qr.png',
                    )),
              ),
              SizedBox(
                height: 0.02 * height,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Redeem();
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
                    height: 0.07 * height,
                    width: 0.9 * width,
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(
                height: 0.02 * height,
              ),
            ]),
      ),
    );
  }
}
