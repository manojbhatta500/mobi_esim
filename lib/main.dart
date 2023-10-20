import 'package:flutter/material.dart';
import 'package:mobi_esim/screens/signup/failed_sign_in.dart';
import 'package:mobi_esim/screens/faq.dart';
import 'package:mobi_esim/screens/navbar/countrybundle.dart';
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
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => Signup(),
        '/term': (context) => TcScreen(),
        '/verify': (context) => Verify(),
        '/welcome': (context) => Welcome(),
        '/country': (context) => CountryBundle(),
        '/faq': (context) => Faq(),
        '/failed': (context) => FailedSignin()
      },
    );
  }
}
