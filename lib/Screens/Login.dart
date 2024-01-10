import 'package:camera/camera.dart';
import 'package:derm_aid/Screens/BookAppointment.dart';
import 'package:derm_aid/Screens/Dashboard.dart';
import 'package:derm_aid/Screens/DoctorSearch.dart';
import 'package:derm_aid/Screens/Profile.dart';
import 'package:derm_aid/Screens/Reminders.dart';
import 'package:flutter/material.dart';

import 'CameraScan.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Reminder'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Reminders()));
                },
              ),
              ElevatedButton(
                child: Text('Doctor search'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorSearch()));
                },
              ),
              ElevatedButton(
                child: Text('Dashboard'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
                },
              ),
              ElevatedButton(
                child: Text('Book Appointment'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BookAppointment()));
                },
              ),
              ElevatedButton(
                child: Text('Camera'),
                onPressed: ()async{
                  await availableCameras().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraScan(cameras: value))));
                },
              ),
              ElevatedButton(
                child: Text('Profile'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                }
              ),
            ],
          )
        )
      ),
    );
  }
}
