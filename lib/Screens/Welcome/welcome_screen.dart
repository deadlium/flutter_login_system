import 'package:flutter/material.dart';
import 'package:login_system/Screens/Home/home-screen.dart';
import 'package:login_system/Screens/Login/Login_screen.dart';
import 'package:login_system/Screens/Welcome/components/body.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Body(),
//     );
//   }
// }

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
