import 'package:camera/camera.dart';
import 'dart:io';
import 'package:derm_aid/Screens/DoctorSearch.dart';
import 'package:derm_aid/Services/Database.dart';
import 'package:flutter/material.dart';

import '../Widgets/NumStepper.dart';
class Result extends StatefulWidget {
  final XFile picture;
  final  data;
  const Result({super.key, required this.picture, this.data, });

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  var data1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data1=widget.data;
  }

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
          height: size.height*1.25,
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
                          data1['name'].toString(),
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
                                      child: Image.file(File(widget.picture.path),fit: BoxFit.cover),
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
                                          image: DecorationImage(image: NetworkImage(data1['img'].toString()),fit: BoxFit.cover)
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
                          data1['over'].toString(),style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54
                        ),
                      ),
                      Text(
                        "Symptoms",
                        style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w600),
                      ),
                      Container(
                        width: double.infinity,
                        height: size.height*0.05*data1['symp'].length,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                            itemCount: data1['symp'].length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 10.0,
                                      height: 10.0,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Expanded(
                                      child: Text(
                                        data1['symp'][index],
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },

                      ),),
                      Text(
                        "Oher images",
                        style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w600),
                      ),
                      Container(
                        height: size.height*0.18,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data1['images'].length,
                          itemBuilder: (context,int index){
                            return Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(5),
                              height: size.height*0.18,
                              width: size.width*0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: size.height*0.14,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: NetworkImage(data1['images'][index]),fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),

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
