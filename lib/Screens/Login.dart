import 'package:derm_aid/Screens/Reminders.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.green,
        child: Center(
          child: ElevatedButton(
            child: Text('Reminder'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Reminders()));
            },
          ),
        )
      ),
    );
  }
}
