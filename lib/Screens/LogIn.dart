import 'package:derm_aid/Screens/Dashboard.dart';
import 'package:derm_aid/Screens/Register.dart';
import 'package:derm_aid/Services/Database.dart';
import 'package:derm_aid/Services/auth.dart';
import 'package:derm_aid/Services/shared_preference.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  final _formKey=GlobalKey<FormState>();
  TextEditingController emailCont=TextEditingController();
  TextEditingController passCont=TextEditingController();

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    check();

  }
  void check()async{
    if (await Login_shared_preference().autoLogin()) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body:
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: size.height,
              decoration: BoxDecoration(

                  image: DecorationImage(image:const AssetImage("assets/images/Registration.jpg"),fit: BoxFit.cover)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: size.height*0.12,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Derm",
                              style: TextStyle(fontSize: 50,fontWeight: FontWeight.w900,color: Color.fromRGBO(19, 35, 70, 1),),
                            ),
                            Text("Aid",
                              style: TextStyle(fontSize: 50,fontWeight: FontWeight.w900,color: Color.fromRGBO(74, 213, 205, 1)),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height*0.025,),
                        Text("Let's empower your skin health",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w200),),
                      ],
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(74, 213, 205, 0.1),
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                              padding: EdgeInsets.symmetric(vertical: 7,horizontal: 25),
                              child: TextFormField(
                                controller: emailCont,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter Email",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  else if(!value.contains("@"))
                                    return 'Invalid email';
                                  else
                                    return null;
                                },
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(74, 213, 205, 0.1),
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                              padding: EdgeInsets.symmetric(vertical: 7,horizontal: 25),
                              child: TextFormField(
                                controller: passCont,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter Password",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  // You can add more complex email validation logic here if needed
                                  return null;
                                },
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                                padding: EdgeInsets.symmetric(vertical: 7,horizontal: 25),
                                child: Center(
                                  child: Text("Forget Password",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16
                                    ),
                                  ),
                                )
                            ),
                            InkWell(
                              onTap: () async{
                                if (_formKey.currentState!.validate()) {
                                  final message=await AuthServices().login(email: emailCont.text, password: passCont.text);
                                  if (message!.contains('Success')) {
                                    await Database().read(emailCont.text.trim());
                                    Login_shared_preference().loginUser(userId: await FirebaseAuth.instance.currentUser?.uid.toString(),email: emailCont.text.trim());
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => const Dashboard(),
                                      ),
                                    );
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(message)),
                                  );
                                }

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(74, 213, 205, 1),
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 25),
                                child: Center(
                                  child: Text("Log In",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22
                                    ),),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account?",
                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w200),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                                    },
                                    child: Text(
                                      " Sign Up",
                                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w200,color: Color.fromRGBO(74, 213, 205, 1)),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                  SizedBox(height: size.height*0.1,)


                ],
              ),
            ),
            physics: NeverScrollableScrollPhysics(),
          )

    );
  }
}
