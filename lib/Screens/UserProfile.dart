import 'package:derm_aid/Data/Const.dart';
import 'package:derm_aid/Screens/EditProfile.dart';
import 'package:derm_aid/Services/Database.dart';
import 'package:derm_aid/Widgets/UserProfile_Widget.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 30,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,size: 30,weight: 3,),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 18,right: 18,bottom: 20,top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("My Profile",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(74, 213, 205, 1),
                        borderRadius: BorderRadius.circular(10)
                    ),

                    child: Row(
                      children: [
                        Text("Edit ",style: TextStyle(color: Colors.white,fontSize: 18),),
                        Icon(Icons.edit,color: Colors.white,size: 20,)
                      ],
                    ),
                  ),
                )
              ],
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/download (7).jpg',),
                    radius: 50,
                  ),
                  Text(UserProfileData.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                  Text(UserProfileData.email,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.blueGrey))
                ],
              )
            ),
            Text("About Me",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 22),),
            UserProfileWidget(opt: UserProfileData.aboutOpt, val: UserProfileData.aboutVal),
            SizedBox(height: 10,),
            Text("Other",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 22),),
            UserProfileWidget(opt: UserProfileData.otherOpt, val: UserProfileData.otherVal)

          ],
        ),
      ),
    );
  }


}
