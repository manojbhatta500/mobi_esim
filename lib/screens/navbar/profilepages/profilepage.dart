import 'package:flutter/material.dart';
import 'package:mobi_esim/customwiget/profile_menu.dart';
import 'package:mobi_esim/providers/manager_provider.dart';
import 'package:mobi_esim/screens/navbar/profilepages/term.dart';
import 'package:mobi_esim/services/apis/manager.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Manager manager = Manager();

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Manager_Provider>(context);

    Widget _buildPopupDialog(BuildContext context, String email) {
      return new AlertDialog(
        title: const Text('Log out'),
        content: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Are you sure ?"),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              print('account not  deleted');
            },
            child: const Text('No '),
          ),
          TextButton(
            onPressed: () async {
              await manager.DeleteUser(prov.email);
              prov.cleardata(context);
              Navigator.pushReplacementNamed(context, '/loading');
              print('account deleted');
            },
            child: const Text('Yes'),
          ),
        ],
      );
    }

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
                    geticon: Icons.assignment_add, heading: 'User Guide')),
            GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context, prov.email),
                  );
                },
                child: ProfileMenu(geticon: Icons.logout, heading: 'Log out'))
          ],
        ),
      ),
    ));
  }
}
