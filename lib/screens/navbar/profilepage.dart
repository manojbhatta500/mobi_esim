import 'package:flutter/material.dart';
import 'package:mobi_esim/screens/deleteacc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return DeleteAcc();
  }
}
