import 'package:flutter/material.dart';
import 'package:mobi_esim/providers/manager_provider.dart';

import 'package:mobi_esim/screens/navbar/countrybundles/countrybundle.dart';
import 'package:mobi_esim/screens/navbar/profilepages/myesim.dart';
import 'package:mobi_esim/screens/navbar/profilepages/profilepage.dart';
import 'package:provider/provider.dart';

class Navigate extends StatefulWidget {
  const Navigate({super.key});

  @override
  State<Navigate> createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    CountryBundle(),
    MyEsim(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Manager_Provider>(context);
    print('total length');
    print(prov.myData!.data!.length);
    return SafeArea(
        child: Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sim_card),
            label: 'My Esim',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    ));
  }
}
