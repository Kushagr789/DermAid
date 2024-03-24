

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derm_aid/Data/Const.dart';
import 'package:derm_aid/Data/Doctor.dart';
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
      'img':"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgB730p0ChSl_CNr5N6n05AGzEtEAhFypOFg&usqp=CAU",
    });
  }

  Future read(String email) async{
    final doc=FirebaseFirestore.instance.collection('Patient').doc(email);
    final snapshot=await doc.get();
    if(snapshot.exists){
      UserProfileData.name=snapshot['name'];
      UserProfileData.email=snapshot['email'];
      UserProfileData.imgUrl=snapshot['img'];
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
      'img':UserProfileData.imgUrl,
    });
    print("done");
  }


  Future<void>getDocList() async{
    FirebaseFirestore.instance.collection('Doctor').get().then((value){
      for(var docSnap in value.docs){
        Doctor.DocList.add(docSnap.data());
        Doctor.DocNameList.add(docSnap['name']);
      }
    });
  }

}
class Disease{
  Future read(String name) async{
    final doc=FirebaseFirestore.instance.collection('Disease').doc('Acne');
    final snapshot=await doc.get();
    if(snapshot.exists)
      {

      return snapshot;}
    else
      return null;

  }
}