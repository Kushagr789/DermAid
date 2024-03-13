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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(74, 213, 205, 0.1),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Derm",
                style: TextStyle(fontSize: 60,fontWeight: FontWeight.w900,color: Color.fromRGBO(19, 35, 70, 1),),
              ),
              Text("Aid",
                style: TextStyle(fontSize: 60,fontWeight: FontWeight.w900,color: Color.fromRGBO(74, 213, 205, 1)),
              ),
            ],
          )
        ),
      )
    );
  }
}
