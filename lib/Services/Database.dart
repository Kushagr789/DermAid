import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derm_aid/Data/Const.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database{
  Future create(String email,String name)async{

    final doc=FirebaseFirestore.instance.collection('Patient').doc(email);
    return await doc.set({
      'name': name,
      'email':email,
      'dob':"01/01/2000",
      'dpw': 0,
      'gender': "none",
      'height': 0,
      'weight': 0,
      'mpd': 0,
    });
  }

  Future read(String email) async{
    final doc=FirebaseFirestore.instance.collection('Patient').doc(email);
    final snapshot=await doc.get();
    if(snapshot.exists){
      UserProfileData.name=snapshot['name'];
      UserProfileData.email=snapshot['email'];
      UserProfileData.aboutVal.addAll({
        0:snapshot['gender'],
        1:snapshot['dob'],
        2:snapshot['height'],
        3:snapshot['weight'],
      });
      UserProfileData.otherVal.addAll({
        0:snapshot['mpd'],
        1:snapshot['dpw'],
        2:"10:00 pm",
        3:"06:00 am"
      });
      print(snapshot);
    }
  }
  Future update(String name, String email,String gender, String dob, int height, int weight, int mpd, int dpw,) async{
    print("x");
    FirebaseFirestore.instance.collection('Patient').doc(email).set({
      'name':name,
      'email':email,
      'gender':gender,
      'dob':dob,
      'height':height,
      'weight':weight,
      'mpd':mpd,
      'dpw':dpw,
    });
    print("done");
  }


}