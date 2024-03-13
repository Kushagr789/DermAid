

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorCardData{
  final List<Map>Doctors=[
    {
      'name':"Dr.Ankit Jain",
      'spec':"Dermatologist",
      'rating':4.0,
      'review':124,
      'imgUrl':"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq2GPGR39QfppdNkS6j3madrSHW2eWlFqxAgzgsN7mwOOjQTzbQvmYK2r2Kg&s"
    },
    {
      'name':"Dr.Ankit Jain",
      'spec':"Dermatologist",
      'rating':4.2,
      'review':124,
      'imgUrl':"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq2GPGR39QfppdNkS6j3madrSHW2eWlFqxAgzgsN7mwOOjQTzbQvmYK2r2Kg&s"
    },
    {
      'name':"Dr.Ankit Jain",
      'spec':"Dermatologist",
      'rating':4.1,
      'review':124,
      'imgUrl':"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq2GPGR39QfppdNkS6j3madrSHW2eWlFqxAgzgsN7mwOOjQTzbQvmYK2r2Kg&s"
    },
    {
      'name':"Dr.Ankit Jain",
      'spec':"Dermatologist",
      'rating':4.7,
      'review':124,
      'imgUrl':"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq2GPGR39QfppdNkS6j3madrSHW2eWlFqxAgzgsN7mwOOjQTzbQvmYK2r2Kg&s"
    },
    {
      'name':"Dr.Ankit Jain",
      'spec':"Dermatologist",
      'rating':4.7,
      'review':124,
      'imgUrl':"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq2GPGR39QfppdNkS6j3madrSHW2eWlFqxAgzgsN7mwOOjQTzbQvmYK2r2Kg&s"
    },
    {
      'name':"Dr.Ankit Jain",
      'spec':"Dermatologist",
      'rating':3.5,
      'review':124,
      'imgUrl':"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq2GPGR39QfppdNkS6j3madrSHW2eWlFqxAgzgsN7mwOOjQTzbQvmYK2r2Kg&s"
    },
    {
      'name':"Dr.Ankit Jain",
      'spec':"Dermatologist",
      'rating':4.8,
      'review':124,
      'imgUrl':"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq2GPGR39QfppdNkS6j3madrSHW2eWlFqxAgzgsN7mwOOjQTzbQvmYK2r2Kg&s"
    },
    {
      'name':"Dr.Ankit Jain",
      'spec':"Dermatologist",
      'rating':4.8,
      'review':124,
      'imgUrl':"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq2GPGR39QfppdNkS6j3madrSHW2eWlFqxAgzgsN7mwOOjQTzbQvmYK2r2Kg&s"
    },
    {
      'name':"Dr.Ankit Jain",
      'spec':"Dermatologist",
      'rating':4.8,
      'review':124,
      'imgUrl':"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq2GPGR39QfppdNkS6j3madrSHW2eWlFqxAgzgsN7mwOOjQTzbQvmYK2r2Kg&s"
    },

  ];
}
class FeatureData{
final List<Map<String,dynamic>> feature=[
  {
    'text':"Scan",
    'icon':FontAwesomeIcons.search,
  },
  {
    'text':"Reports",
    'icon':Icons.bar_chart,
  },
  {
    'text':"Reminder",
    'icon':Icons.notifications_active,
  },
  {
    'text':"Consult",
    'icon':FontAwesomeIcons.userDoctor,
  },

];
}

class UserProfileData{
  static String name="";
  static String imgUrl="";
  static String email="";
  static List<String> aboutOpt=[
    "Gender",
    "Date Of Birth",
    "Height(cm)",
    "Weight(kg)"
  ];
  static Map<int,dynamic> aboutVal= {
    0:"none",
    1:"01/01/2000",
    2:0,
    3:0
  };
  static List<String> otherOpt=[
    "Medicine per day",
    "Diagnosis per week",
    "Get in bed",
    "Wake Up"
  ];
  static Map<int,dynamic> otherVal={
    0:0,
    1:0,
    2:"10:00 pm",
    3:"06:00 am"
  };
}