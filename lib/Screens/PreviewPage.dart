import 'dart:io';

import 'package:camera/camera.dart';
import 'package:derm_aid/Screens/Result.dart';
import 'package:derm_aid/Services/Database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/NumStepper.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({super.key,required this.picture});
  final XFile picture;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,size: 24,color: Color.fromRGBO(188, 188, 188, 1),)
        ),
        backgroundColor: Color.fromRGBO(39, 39, 39, 1),
        elevation: 0,
        centerTitle: true,
        title: Text("Analysis",
          style: TextStyle(
            color: Color.fromRGBO(188, 188, 188, 1),
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.question_mark_rounded,color: Color.fromRGBO(188, 188, 188, 1),size: 30,))
        ],
      ),
    body:  Column(
    children: [
      Container(
        width: double.infinity,
        height:size.height*0.11,
        color: Color.fromRGBO(39, 39, 39, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumStepper(
              totalSteps: 4,
              width: MediaQuery.of(context).size.width,
              curStep: 3,
              stepCompColor: Color.fromRGBO(76, 239, 19, 1),
              currentStepColor: Color.fromRGBO(74, 213, 205, 1),
              inactiveColor: Color.fromRGBO(188, 188, 188, 1),
              lineWidth: 1,
            ),],
        ),
      ),
      Container(
        width: double.infinity,
        height: size.height*0.71,
        child: Image.file(File(picture.path),fit: BoxFit.cover,width: 250,),
      ),
      Expanded(
      child: InkWell(
        onTap: () async{

          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => Result(picture: picture,)));
        },
    child: Container(
    width: double.infinity,
    color: Color.fromRGBO(74, 213, 205, 1),
    child: Center(
    child: Text(
    "Next",
    style: TextStyle(color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 24),
    ),
    ),
    ),
    ),
    )
    ],
    ),

    );
    }
  }

