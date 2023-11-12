import 'package:flutter/material.dart';
import 'package:mobi_esim/firebase_options.dart';
import 'package:mobi_esim/screens/and_guide.dart';
import 'package:mobi_esim/screens/androidguide/fromgallery.dart';

import 'package:mobi_esim/screens/ios_guide.dart';

import 'package:mobi_esim/screens/navbar/profilepages/contactus.dart';
import 'package:mobi_esim/screens/navbar/profilepages/deleteacc.dart';
import 'package:mobi_esim/screens/navbar/profilepages/my_wallet.dart';
import 'package:mobi_esim/screens/navbar/profilepages/myesim.dart';

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
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Stripe.publishableKey =
      "pk_test_51OASCtE43HY3bEwGREnWOwzTc5kOFbZxw6F6ySv1yVyIe7l8oHbconkjvZEOD2TCTWsaTPUkXMUmD4ynEdIh47uQ00mBYUZFVx";

  //Load our .env file that contains our Stripe Secret key
  await dotenv.load(fileName: "assets/.env");
  print('hello world');

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
