import 'package:derm_aid/Data/Const.dart';
import 'package:derm_aid/Widgets/chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:derm_aid/Widgets/chart/bar_chart.dart';
import 'package:derm_aid/Widgets/chart/line_chart.dart';


class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 18),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Color.fromRGBO(220, 220,220, 1),width: 1,strokeAlign: BorderSide.strokeAlignOutside),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: Offset(0,4),
                color: Color.fromRGBO(220, 220, 220, 0.25)
            )
          ]
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(UserProfileData.imgUrl.toString(),)
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(UserProfileData.name,
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.w700
                  ),
                ),
                Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person,color: Color.fromRGBO(119, 128, 137, 1),),
                        Text(UserProfileData.aboutVal[0],
                          style: TextStyle(
                              color:Color.fromRGBO(119, 128, 137, 1),
                              fontSize: 12
                          ),)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.fileLines,color: Color.fromRGBO(119, 128, 137, 1),),
                        Text("Diagnostics",
                          style: TextStyle(
                              color:Color.fromRGBO(119, 128, 137, 1),
                              fontSize: 12
                          ),)
                      ],
                    ),
                    SizedBox(width:10)
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BioData extends StatelessWidget {
  const BioData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 18),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Color.fromRGBO(220, 220,220, 1),width: 1,strokeAlign: BorderSide.strokeAlignOutside),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: Offset(0,4),
                color: Color.fromRGBO(220, 220, 220, 0.25)
            )
          ]
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Biomarkers",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    Text("Last month",style: TextStyle(
                      color: Color.fromRGBO(127, 136, 144, 1),
                      fontSize: 12,
                    ),)
                  ],
                ),
                Icon(Icons.arrow_forward_ios,color: Colors.black,size: 25,)
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Max HR",style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w700
                      ),
                      ),
                      Text("168 bpn",style: TextStyle(
                        color: Color.fromRGBO(127, 136, 144, 1),
                        fontSize: 12,
                      ),)
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  height: 100,
                  padding: EdgeInsets.all(2),
                  child: BarChartCont(),
                )

              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Haemoglobin",style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w700
                    ),
                    ),
                    Text("15.3 (gm/dL)",style: TextStyle(
                      color: Color.fromRGBO(127, 136, 144, 1),
                      fontSize: 12,
                    ),)
                  ],
                ),
                Container(
                  width: 200,
                  height: 100,
                  padding: EdgeInsets.all(2),
                  child: LineChartContent(),
                )
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Creatinine",style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w700
                    ),
                    ),
                    Text("1.02 (mg/dL",style: TextStyle(
                      color: Color.fromRGBO(127, 136, 144, 1),
                      fontSize: 12,
                    ),)
                  ],
                ),
                Container(
                  width: 200,
                  height: 100,
                  padding: EdgeInsets.all(2),
                  child: BarChartCont(),
                )
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class DiseaseReview extends StatelessWidget {
  const DiseaseReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 18),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Color.fromRGBO(220, 220,220, 1),width: 1,strokeAlign: BorderSide.strokeAlignOutside),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: Offset(0,4),
                color: Color.fromRGBO(220, 220, 220, 0.25)
            )
          ]
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Disease Review",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    Text("Last 6 months",style: TextStyle(
                      color: Color.fromRGBO(127, 136, 144, 1),
                      fontSize: 12,
                    ),)
                  ],
                ),
                Icon(Icons.arrow_forward_ios,color: Colors.black,size: 25,)
              ],
            ),
            flex: 2,
          ),
          Expanded(
            child: Row(
              children: [
              Container(width: 120,child: Stack(
                children: [
                  Align(alignment: Alignment.center,child: Text("60%",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),)),
                  PieChartCont(),
                ],
              )),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(19, 35, 70,1)
                            ),
                          ),
                          Text(
                            "60%",
                            style: TextStyle(
                                fontSize: 18,fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(),
                          Text(
                            "Migraine",
                            style: TextStyle(
                                fontSize: 15,fontWeight: FontWeight.w500,color: Color.fromRGBO(127, 136, 144, 1)
                            ),
                          ),
                          SizedBox(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(74, 213, 205, 1)
                            ),
                          ),
                          Text(
                            "30%",
                            style: TextStyle(
                                fontSize: 18,fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(),
                          Text(
                            "Influenza",
                            style: TextStyle(
                                fontSize: 15,fontWeight: FontWeight.w500,color: Color.fromRGBO(127, 136, 144, 1)
                            ),
                          ),
                          SizedBox(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(119, 128, 137, 1)
                            ),
                          ),
                          Text(
                            "10%",
                            style: TextStyle(
                                fontSize: 18,fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(),
                          Text(
                            "Covid 19",
                            style: TextStyle(
                                fontSize: 15,fontWeight: FontWeight.w500,color: Color.fromRGBO(127, 136, 144, 1)
                            ),
                          ),
                          SizedBox(),
                        ],
                      ),
                    ],
                  ),
                )
            ],
          ),flex: 3,)
        ],
      ),
    );
  }
}

class Medicine extends StatelessWidget {
  final size;
  const Medicine({super.key,required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 18),
      margin: EdgeInsets.only(top: 10,bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Color.fromRGBO(220, 220,220, 1),width: 1,strokeAlign: BorderSide.strokeAlignOutside),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: Offset(0,4),
                color: Color.fromRGBO(220, 220, 220, 0.25)
            )
          ]
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Medicine",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    Text("Last 6 months",style: TextStyle(
                      color: Color.fromRGBO(127, 136, 144, 1),
                      fontSize: 12,
                    ),)
                  ],
                ),
                Icon(Icons.arrow_forward_ios,color: Colors.black,size: 25,)
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Tosymra",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
                    SizedBox(width: 110,),
                    Text("Imtrex",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
                  ],
                ),
                Stack(

                  children: [
                    Container(
                      height: 5,
                      width: 350,
                      color: Color.fromRGBO(119, 128, 137, 1),
                    ),
                    Container(
                      height: 5,
                      width: 250,
                      color: Color.fromRGBO(74, 213, 205, 1),
                    ),
                    Container(
                      height: 5,
                      width: 170,
                      color: Color.fromRGBO(19, 35, 70,1),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Jan",style: TextStyle(fontSize: 13,color: Color.fromRGBO(119, 128, 137, 1)),),
                    Text("Feb",style: TextStyle(fontSize: 13,color: Color.fromRGBO(119, 128, 137, 1)),),
                    Text("Mar",style: TextStyle(fontSize: 13,color: Color.fromRGBO(119, 128, 137, 1)),),
                    Text("Apr",style: TextStyle(fontSize: 13,color: Color.fromRGBO(119, 128, 137, 1)),),
                    Text("May",style: TextStyle(fontSize: 13,color: Color.fromRGBO(119, 128, 137, 1)),),
                    Text("Jun",style: TextStyle(fontSize: 13,color: Color.fromRGBO(119, 128, 137, 1)),),
                  ],
                )
              ],
            )
          )
        ],
      ),
    ) ;
  }
}
