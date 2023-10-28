import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/profile_menu.dart';
import 'package:mobi_esim/screens/voucher.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 0.01 * height,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xff3b57a6),
                  )),
              SizedBox(
                width: 0.30 * width,
              ),
              Text(
                'My wallet',
                style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
              )
            ],
          ),
          SizedBox(
            height: 0.25 * height,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Voucher();
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
            child: ProfileMenu(
                geticon: Icons.wallet_giftcard_sharp, heading: 'voucher code'),
          ),
          ProfileMenu(geticon: Icons.money, heading: 'Refer & Earn'),
          ProfileMenu(geticon: Icons.attach_money, heading: 'Cash Back Rewards')
        ],
      ),
    )));
  }
}
