import 'package:flutter/material.dart';

class RegCountry extends StatelessWidget {
  const RegCountry({super.key, required this.number});

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Text(
          '$number countries',
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
      ),
    );
  }
}
