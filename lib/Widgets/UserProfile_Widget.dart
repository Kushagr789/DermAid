import 'package:derm_aid/Data/Const.dart';
import 'package:derm_aid/Screens/EditProfile.dart';
import 'package:flutter/material.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key, required this.opt, required this.val});
  final List opt;
  final Map<int,dynamic> val;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height*0.2,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              mainAxisExtent: size.height*0.1
          ),
          itemCount: 4,
          itemBuilder: (context,index){
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              height: size.height*0.1,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(74, 213, 205, 0.1)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(opt[index].toString(),
                    style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w600),
                  ),
                  Text(val[index].toString(),
                    style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
