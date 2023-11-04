import 'package:flutter/material.dart';

class NotButton extends StatelessWidget {
  const NotButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/notifications');
        },
        icon: Icon(
          Icons.notifications,
          color: Color(0xff3b57a6),
        ));
  }
}
