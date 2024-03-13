
import 'package:derm_aid/Screens/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';





void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(apiKey: 'AIzaSyAg30b_DCn3QxdZWHkazgnnbzCUGBAlR5Y', appId: '1:534527630882:android:cfc813bd2337fa9729747b', messagingSenderId: '534527630882', projectId: 'dermaid-67a70',storageBucket: 'dermaid-67a70.appspot.com'));

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp
    ]
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

