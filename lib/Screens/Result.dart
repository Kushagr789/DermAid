import 'package:derm_aid/Screens/DoctorSearch.dart';
import 'package:flutter/material.dart';

import '../Widgets/NumStepper.dart';
class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
      body: Column(
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
                  curStep: 4,
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
            color: Colors.lightGreen,
          ),
          Expanded(
            child: InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorSearch())),
              child: Container(
                width: double.infinity,
                color: Color.fromRGBO(74, 213, 205, 1),
                child: Center(
                  child: Text(
                    "Consult Doctor",
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
