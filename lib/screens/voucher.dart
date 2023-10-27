import 'package:flutter/material.dart';
import 'package:mobi_esim/const/util.dart';
import 'package:mobi_esim/screens/miniqr.dart';

class Voucher extends StatefulWidget {
  const Voucher({super.key});

  @override
  State<Voucher> createState() => _VoucherState();
}

class _VoucherState extends State<Voucher> {
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
                    width: 0.20 * width,
                  ),
                  Text(
                    'Voucher Code  ',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
              Divider(),
              Text(
                'Please enter the code or scan to redeem',
                style: minihead,
              ),
              SizedBox(
                height: 0.02 * height,
              ),
              Text(
                'Voucher Code',
                style: minihead,
              ),
              SizedBox(
                height: 0.02 * height,
              ),
              Container(
                height: 0.07 * height,
                width: 0.9 * width,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Enter code',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              SizedBox(
                height: 0.05 * height,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return MiniQr();
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
            ]),
      ),
    );
  }
}
