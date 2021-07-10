import 'package:flutter/material.dart';
import 'package:final_project/RegisterScreen.dart';
import 'package:final_project/LogInScreen.dart';

class AuthenticationScreen extends StatefulWidget {
  AuthenticationScreen({Key key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool showLogin = true;

  void toggleScreens() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    //return LogInScreen();
    if (showLogin) {
      return LogInScreen(
        toggleScreen: toggleScreens,
      );
    } else {
      return RegisterScreen(
        toggleScreen: toggleScreens,
      );
    }
  }
}
