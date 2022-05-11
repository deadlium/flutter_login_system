import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:login_system/Screens/Login/Login_screen.dart';
import 'package:login_system/Screens/Signup/components/background.dart';
import 'package:login_system/constants.dart';

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
        Response response =
            await post(Uri.parse("https://reqres.in/api/login"), body: {
          "email": email,
          "password": password,
        });
        if (response.statusCode == 200) {
          // ignore: unused_local_variable
          var data = jsonDecode(response.body.toString());
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Account Login')));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Field')));
        }
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Field')));
      }
    }

    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Signup",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),
          ),
          SizedBox(height: size.height * 0.03),
          SvgPicture.asset(
            "assets/icons/signup.svg",
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
            onTap: () {
              login(emailControllar.text.toString(),
                  passControllar.text.toString());
            },
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(29)),
                child: const Center(
                  child: Text(
                    "SIGNUP",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Already have an Account ? ",
                style: TextStyle(color: kPrimaryColor),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                },
                child: const Text(
                  "Login",
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
