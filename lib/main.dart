import 'package:flutter/material.dart';
import 'package:login_system/Screens/Welcome/welcome_screen.dart';
import 'package:login_system/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String token = '';
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var obtainedToken = pref.getString('token');
    setState(() {
      token = obtainedToken!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "learnflu",
      theme: ThemeData(
          primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
      home: const WelcomeScreen(),
    );
  }
}
