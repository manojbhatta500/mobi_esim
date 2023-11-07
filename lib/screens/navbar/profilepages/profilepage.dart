import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/profile_menu.dart';
import 'package:mobi_esim/screens/navbar/profilepages/term.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Center(
                child: Text(
              'Profile',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
            )),
            Icon(
              Icons.account_circle_outlined,
              size: 50,
            ),
            Center(
                child: Text(
              'Hello guest',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
            )),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: ProfileMenu(
                  geticon: Icons.account_circle_outlined,
                  heading: 'SingUp / SignIn'),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/mywallet');
                },
                child:
                    ProfileMenu(geticon: Icons.wallet, heading: 'my wallet')),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/contactus');
                },
                child: ProfileMenu(geticon: Icons.call, heading: 'Contact Us')),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/faq');
                },
                child: ProfileMenu(geticon: Icons.help, heading: 'FAQ')),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Term(get: true);
                }));
              },
              child: ProfileMenu(
                  geticon: Icons.assignment, heading: 'Terms And Conditions'),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Term(get: false);
                  }));
                },
                child: ProfileMenu(geticon: Icons.info, heading: 'About US')),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/userguide');
                },
                child: ProfileMenu(
                    geticon: Icons.assignment_add, heading: 'User Guide'))
          ],
        ),
      ),
    ));
  }
}
