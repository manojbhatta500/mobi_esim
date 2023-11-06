import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Global extends StatelessWidget {
  const Global({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          GlobalContainer(),
          GlobalContainer(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    ));
  }
}

class GlobalContainer extends StatefulWidget {
  const GlobalContainer({super.key});

  @override
  State<GlobalContainer> createState() => _GlobalContainerState();
}

class _GlobalContainerState extends State<GlobalContainer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: 0.3 * height,
      width: 0.6 * width,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
          color: Color(0xff2941b8ea), borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Global_Bundle 300MB',
                style: TextStyle(color: Color(0xff0082d8), fontSize: 15),
              ),
              Container(
                  height: 0.06 * height,
                  child: Image(image: AssetImage('assets/global.png')))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(CupertinoIcons.globe),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Data',
                    style: TextStyle(color: Color(0xff464343), fontSize: 14),
                  ),
                ],
              ),
              Text(
                '2 GB',
                style: TextStyle(color: Color(0xff39393c), fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(CupertinoIcons.tree),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Coverage',
                    style: TextStyle(color: Color(0xff464343), fontSize: 14),
                  ),
                ],
              ),
              Text(
                '38 Countries',
                style: TextStyle(color: Color(0xff39393c), fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(CupertinoIcons.timer),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Validity',
                    style: TextStyle(color: Color(0xff464343), fontSize: 14),
                  ),
                ],
              ),
              Text(
                '7 Days',
                style: TextStyle(color: Color(0xff39393c), fontSize: 14),
              ),
            ],
          ),
          Container(
            width: 0.8 * width,
            height: 0.06 * height,
            decoration: BoxDecoration(
                color: Color(0xff3b57a6),
                borderRadius: BorderRadius.circular(20)),
            child: Center(
                child: Text(
              '\$5.50-View details',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          )
        ],
      ),
    );
  }
}
