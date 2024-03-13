import 'package:derm_aid/Screens/Dashboard.dart';
import 'package:derm_aid/Screens/LogIn.dart';
import 'package:derm_aid/Services/Database.dart';
import 'package:derm_aid/Services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey=GlobalKey<FormState>();
  TextEditingController emailCont=TextEditingController();
  TextEditingController passCont=TextEditingController();
  TextEditingController nameCont=TextEditingController();
  TextEditingController conPassCont=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
                height: size.height*0.1,
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

                            controller: nameCont,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your full name",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              }

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
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(74, 213, 205, 0.1),
                              borderRadius: BorderRadius.circular(100)
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                          padding: EdgeInsets.symmetric(vertical: 7,horizontal: 25),
                          child: TextFormField(
                            controller: conPassCont,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Confirm Password",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              else if(value!=passCont.text)
                                return 'Password does not match';
                              else
                                return null;
                            },
                          ),
                        ),

                        InkWell(
                          onTap: () async{
                            if (_formKey.currentState!.validate()) {
                              final message=await AuthServices().registration(email: emailCont.text, password: passCont.text);
                              if (message!.contains('Success')) {
                                print("success");
                                await Database().create(emailCont.text, nameCont.text);
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) => const LogIn()));
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
                              child: Text("Register",
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
                                "Already have an account?",
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w200),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
                                },
                                child: Text(
                                  " Sign In",
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


            ],
          ),
        ),
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
