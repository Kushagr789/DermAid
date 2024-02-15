import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LogIn.dart';
import 'Onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int? isviewed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>isviewed!=1?Onboarding():LogIn()));
    });
  }
  void check() async{
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isviewed = prefs.getInt('onboard');
    print(isviewed.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Text("DermAid",
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
      )
    );
  }
}
