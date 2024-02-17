import 'package:flutter/material.dart';

import '../Screens/LogIn.dart';
import '../Services/auth.dart';
import '../Services/shared_preference.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(19, 35, 70, 1)
            ),
            padding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/download (7).jpg',),
                  ),
                  Text('Kush Saxena',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w600),),
                  Text('kush@gmail.com',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500,))
                ],
              ),
            ),
          ),
          ListTile(
            selected: true,
            selectedColor: Color.fromRGBO(19, 35, 70, 1),
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.auto_graph),
            title: Text("Reports"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notifications"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text("Contact"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text("About"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Help & Supports"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout,color: Colors.red,),
            title: Text("LogOut",style: TextStyle(color: Colors.red),),
            onTap: () {
              AuthServices().logOut();
              Login_shared_preference().logout();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogIn()));
            },
          )
        ],
      ),
    );
  }
}
