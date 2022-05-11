import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_system/Screens/Home/home-screen.dart';
import 'package:login_system/Screens/Login/Login_screen.dart';
import 'package:login_system/Screens/Welcome/components/body.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class welcomeScreen extends StatelessWidget {
//   const welcomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Body(),
//     );
//   }
// }

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  void initState() {
    super.initState();
    chechLogin();
  }

  void chechLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString('token');
    if (val != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
