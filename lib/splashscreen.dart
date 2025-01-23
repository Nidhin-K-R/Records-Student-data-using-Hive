import 'package:flutter/material.dart';
import 'package:hive_practice_1/homescreen.dart';
import 'package:hive_practice_1/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      bool decide = pref.getBool('key') ?? false;
      if (decide) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => HomeScreen()));
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => LoginPage()));
      }
    });
    return Scaffold(
      body: Center(
          child: Image.network(
              "https://images.squarespace-cdn.com/content/v1/55b21c72e4b09b5e3592ea96/1570538839979-GSBKFM9404FHTHY7NXEY/SDB-icon.png")),
    );
  }
}
