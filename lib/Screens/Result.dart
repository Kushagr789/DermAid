import 'package:camera/camera.dart';
import 'dart:io';
import 'package:derm_aid/Screens/DoctorSearch.dart';
import 'package:flutter/material.dart';

import '../Widgets/NumStepper.dart';
class Result extends StatefulWidget {
  final XFile picture;
  const Result({super.key, required this.picture});

  @override
  State<Result> createState() => _ResultState(picture: picture);
}

class _ResultState extends State<Result> {
  final XFile picture;

  _ResultState({required this.picture});
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
        title: Text("Result",
          style: TextStyle(
            color: Color.fromRGBO(188, 188, 188, 1),
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.question_mark_rounded,color: Color.fromRGBO(188, 188, 188, 1),size: 30,))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          height: size.height*1.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Acne (Acne Vulgaris)",
                          style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.w700),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(flex: 1,
                              child: Container(
                                height: size.height*0.25,

                                padding: EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: size.height*0.2,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.blue
                                      ),
                                      child: Image.file(File(picture.path),fit: BoxFit.cover),
                                    ),
                                    Text("Scanned Image",style: TextStyle(color: Colors.black,fontSize: 14),)
                                  ],
                                ),
                              )
                          ),
                          Expanded(flex: 1,
                              child: Container(
                                height: size.height*0.25,

                                padding: EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: size.height*0.2,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.blue
                                      ),
                                    ),
                                    Text("Disease Image",style: TextStyle(color: Colors.black,fontSize: 14),)
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                      Text(
                        "Overview",
                        style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Ipsum has been the industry's standard dummy text ever since the 1500s.Ipsum has been the industry's standard dummy text ever since the 1500s.Ipsum has been the industry's standard dummy text ever since the 1500s.Ipsum has been the industry's standard dummy text ever since the 1500s.",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54
                        ),
                      ),
                      Text(
                        "Symptoms",
                        style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Ipsum has been the industry's standard dummy text ever since the 1500s.Ipsum has been the industry's standard dummy text ever since the 1500s.",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(119, 128, 137, 1)
                        ),
                      ),
                      Text(
                        "Oher images",
                        style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w600),
                      ),
                      Container(
                        height: size.height*0.21,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context,int index){
                            return Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(5),
                              height: size.height*0.21,
                              width: size.width*0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: size.height*0.14,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                  Text("Severity:80%",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )

                    ],
                  ),
                ),
              ),
              InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorSearch())),
                  child: Container(
                    width: double.infinity,
                    height: size.height*0.09,
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

            ],
          ),
        ),
      )
    );
  }
}
