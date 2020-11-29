import 'package:flutter/material.dart';
import 'package:flutchat/components/rounded_button.dart';
import 'package:flutchat/screens/chat_screen.dart';
import 'package:flutchat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.yellowAccent),
                cursorColor: Colors.pinkAccent,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.pinkAccent, width: 1.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                  ),
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.redAccent),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.yellowAccent),
                cursorColor: Colors.pinkAccent,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.pinkAccent, width: 1.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                  ),
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.redAccent),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Register',
                colour: Colors.pinkAccent,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    var newUser = await _auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    if (newUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }

                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
