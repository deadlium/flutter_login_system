import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_system/Screens/Login/login_screen.dart';
import 'package:login_system/Screens/Signup/Signup_screen.dart';
import 'package:login_system/Screens/Welcome/components/background.dart';
import 'package:login_system/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Welcome TO Auth Demo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              child: ClipRRect(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    child: FlatButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 40),
                      color: kPrimaryColor,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              child: ClipRRect(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    child: FlatButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 40),
                      color: kPrimaryLightColor,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignupScreen();
                        }));
                      },
                      child: Text(
                        "SIGNUP",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
