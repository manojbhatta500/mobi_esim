import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobi_esim/const/util.dart';

class DataCunsumptions extends StatelessWidget {
  const DataCunsumptions({super.key});

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Europe - Consumption',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextButton(
                      onPressed: () {
                        print('printed cancel button');
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Center(
                child: Image(
                  image: AssetImage('assets/per.png'),
                  height: 80,
                  width: 80,
                ),
              ),
              Center(
                child: Text(
                  '48%',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Total Data Consumption.',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  '4.840 GB / 10 GB',
                  style: minihead,
                ),
              ),
              SizedBox(
                height: 2,
              )
            ]),
      ),
    );
  }
}
