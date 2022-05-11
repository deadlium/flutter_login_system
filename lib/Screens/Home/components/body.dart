import 'package:flutter/material.dart';
import 'package:login_system/Screens/Home/components/background.dart';
import 'package:login_system/Screens/Login/Login_screen.dart';
import 'package:login_system/Screens/Welcome/welcome_screen.dart';
import 'package:login_system/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ClipRRect(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    child: FlatButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 40),
                      color: kPrimaryColor,
                      onPressed: () async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        await pref.clear();
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
          ],
        ),
      ),
    );
  }
}
