import 'package:flutter/material.dart';
import 'package:flutchat/screens/welcome_screen.dart';
import 'package:flutchat/screens/login_screen.dart';
import 'package:flutchat/screens/registration_screen.dart';
import 'package:flutchat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlutChat());
}

class FlutChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen()
      },
    );
  }
}
