import 'package:flutter/material.dart';

class LogButton extends StatelessWidget {
  const LogButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/signup');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            'LOG IN',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
