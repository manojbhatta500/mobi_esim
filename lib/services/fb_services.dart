import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

class FbServices {
  Future<void> gettoken() async {
    //it works i tested it in main
    final notificationSettings =
        await FirebaseMessaging.instance.requestPermission(provisional: true);

    final Token = await FirebaseMessaging.instance.getToken();
    print('Token: $Token');
  }
}
