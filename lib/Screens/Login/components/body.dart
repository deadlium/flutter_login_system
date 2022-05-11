import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:login_system/Screens/Home/home-screen.dart';
import 'package:login_system/Screens/Login/components/background.dart';
import 'package:login_system/Screens/Signup/Signup_screen.dart';
import 'package:login_system/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailControllar = TextEditingController();
    TextEditingController passControllar = TextEditingController();

    void login(String email, password) async {
      try {
        if (emailControllar.text.isNotEmpty && passControllar.text.isNotEmpty) {
          Response response =
              await post(Uri.parse("https://reqres.in/api/login"), body: {
            "email": email,
            "password": password,
          });
          if (response.statusCode == 200) {
            var data = jsonDecode(response.body.toString());
            print('token: ' + data['token']);

            // cookies wala
            SharedPreferences pref = await SharedPreferences.getInstance();
            await pref.setString('token', data['token']);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HomeScreen();
            }));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('invalid')));
          }
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Blank Field')));
        }
      } catch (e) {
        print(e.toString());
      }
    }

    // var data = jsonDecode(response.body.toString());
    // print(data['token']);
    // print('Account Login Successfully');
    // final SharedPreferences sharedPreferences =
    //     await SharedPreferences.getInstance();
    // sharedPreferences.setString('token', data['token']);
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return HomeScreen();
    // }));

    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),
          ),
          SizedBox(height: size.height * 0.03),
          SvgPicture.asset(
            "assets/icons/login.svg",
            height: size.height * 0.35,
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: size.width * 0.8,
            decoration: BoxDecoration(
              color: kPrimaryLightColor,
              borderRadius: BorderRadius.circular(29),
            ),
            child: TextField(
              controller: emailControllar,
              onChanged: (value) {},
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: kPrimaryColor,
                ),
                hintText: "Enter Your Email",
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: size.width * 0.8,
            decoration: BoxDecoration(
              color: kPrimaryLightColor,
              borderRadius: BorderRadius.circular(29),
            ),
            child: TextField(
              controller: passControllar,
              onChanged: (value) {},
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                suffixIcon: Icon(
                  Icons.visibility,
                  color: kPrimaryColor,
                ),
                hintText: "Enter Your password",
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          GestureDetector(
            onTap: () async {
              login(
                emailControllar.text.toString(),
                passControllar.text.toString(),
              );
            },
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(29)),
                child: Center(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Don’t have an Account ? ",
                style: TextStyle(color: kPrimaryColor),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignupScreen();
                  }));
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
