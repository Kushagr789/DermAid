import 'package:carousel_slider/carousel_slider.dart';
import 'package:derm_aid/Data/Const.dart';
import 'package:derm_aid/Screens/CameraScan.dart';
import 'package:derm_aid/Screens/LogIn.dart';
import 'package:derm_aid/Services/Database.dart';
import 'package:derm_aid/Services/auth.dart';
import 'package:derm_aid/Services/shared_preference.dart';
import 'package:derm_aid/Widgets/Drawer.dart';
import 'package:derm_aid/Widgets/Widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Data/Doctor.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: DrawerWidget()
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leadingWidth: 80,
            leading: Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Icon(Icons.menu,color: Colors.white,size: 40,),
                );
              },
            ),
            centerTitle: true,

            title: Text(
              "Hello "+UserProfileData.name+"!",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
            actions: [
              Container(
                color: Color.fromRGBO(19, 35, 70, 1),
                margin: EdgeInsets.only(right: 20),
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.translate,color: Colors.white,size: 35,),
                    onPressed: (){},
                  )
                ),
              )
            ],
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Color.fromRGBO(19, 35, 70, 1),

            flexibleSpace: FlexibleSpaceBar(

              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    color: Color.fromRGBO(19, 35, 70, 1),
                  ),
                  Positioned(
                    top: 140,
                    child: Container(

                        padding: EdgeInsets.only(left: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Scan.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text("Diagnos.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text("Get Cured.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                  Positioned(
                    top: 150,
                    right: 20,
                    child: Container(
                        height: size.height*0.18,
                        width: size.width*0.36,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/solar_round-graph-outline.jpg"),
                            fit: BoxFit.cover
                          )
                        ),
                    ),
                  )

                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(19, 35, 70, 1)
              ),
              height: size.height,
              width: double.infinity,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                    color: Colors.white
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20,left: 24,right: 24),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Top picks for you",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.w800
                            ),
                          ),
                          Carousel(),
                          SizedBox(height: size.height*0.04,),
                          Text("Explore",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w800
                            ),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: size.height*0.5,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: FeatureData().feature.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 5
                      ),
                          itemBuilder: (context,index){
                            return Container(

                              height: size.height*0.25,
                              width: size.width*0.45,

                              child: FeatureCard(text: FeatureData().feature[index]['text'],icon: FeatureData().feature[index]['icon'],size: size),
                            );
                          }
                      ),
                    ),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void getData() async{
    await Database().read(FirebaseAuth.instance.currentUser!.email.toString());
    await Database().getDocList();
    setState(() {

    });
  }
}


