import 'package:flutter/material.dart';
import 'package:mobi_esim/screens/and_guide.dart';
import 'package:mobi_esim/screens/androidguide/fromgallery.dart';

import 'package:mobi_esim/screens/ios_guide.dart';

import 'package:mobi_esim/screens/navbar/profilepages/contactus.dart';
import 'package:mobi_esim/screens/navbar/profilepages/deleteacc.dart';
import 'package:mobi_esim/screens/navbar/profilepages/my_wallet.dart';
import 'package:mobi_esim/screens/navbar/profilepages/myesim.dart';
import 'package:mobi_esim/screens/navbar/profilepages/term.dart';
import 'package:mobi_esim/screens/navbar/profilepages/userguide.dart';
import 'package:mobi_esim/screens/navigate.dart';
import 'package:mobi_esim/screens/notification.dart';
import 'package:mobi_esim/screens/qr.dart';
import 'package:mobi_esim/screens/signup/failed_sign_in.dart';
import 'package:mobi_esim/screens/navbar/profilepages/faq.dart';
import 'package:mobi_esim/screens/navbar/countrybundles/countrybundle.dart';
import 'package:mobi_esim/screens/signup/signup.dart';
import 'package:flutter/services.dart';
import 'package:mobi_esim/screens/signup/term&con.dart';
import 'package:mobi_esim/screens/signup/verifypage.dart';
import 'package:mobi_esim/screens/signup/welcome.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const Root());
}

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/navigate',
      routes: {
        '/signup': (context) => Signup(),
        '/term': (context) => TcScreen(),
        '/verify': (context) => Verify(),
        '/welcome': (context) => Welcome(),
        '/country': (context) => CountryBundle(),
        '/navigate': (context) => Navigate(),
        '/faq': (context) => Faq(),
        '/failed': (context) => FailedSignin(),
        '/contactus': (context) => ContactUs(),
        '/delete': (context) => DeleteAcc(),
        '/qrcode': (context) => QrCode(),
        '/mywallet': (context) => MyWallet(),
        '/notifications': (context) => Notifications(),
        '/userguide': (context) => UserGuide(),
        '/iosguide': (context) => IosGuide(),
        '/andguide': (context) => AndGuide(),
        '/fromgallery': (context) => FromGallery(),
        '/myesim': (context) => MyEsim(),
      },
    );
  }
}
