import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mpdController = TextEditingController();
  final TextEditingController _dpwController = TextEditingController();

  DateTime birthDate=DateTime.utc(2019,01,01);
  TimeOfDay gib=TimeOfDay(hour: 22, minute: 30);
  TimeOfDay wu=TimeOfDay(hour: 06, minute: 30);

  final _formKey=GlobalKey<FormState>();
  var selectGen=0;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: birthDate,
        firstDate: DateTime(1950),
        lastDate: DateTime(2020));
    if (picked != null && picked != birthDate) {
      setState(() {
        birthDate = picked;
      });
    }
  }

  Future<void> _selectTimeG(BuildContext context) async {
    final TimeOfDay? picked_s = await showTimePicker(
        context: context,
        initialTime: gib,
    );
    if(picked_s!=null&&picked_s!=gib){
      setState(() {
        gib=picked_s;
      });
    }
  }
  Future<void> _selectTimeW(BuildContext context) async {
    final TimeOfDay? picked_s = await showTimePicker(
      context: context,
      initialTime: wu,
    );
    if(picked_s!=null&&picked_s!=wu){
      setState(() {
        wu=picked_s;
      });
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text="Kush Saxena";
    _emailController.text="kush@gmail.com";
    _dpwController.text="02";
    _mpdController.text="04";
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,size: 30,weight: 3,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height*1.1,
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("About Me",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 22),),
                Text("Name",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(74, 213, 205, 0.1),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10,),
                  padding: EdgeInsets.symmetric(vertical: 7,horizontal: 25),
                  child: TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Name",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }

                        return null;
                    },
                  ),
                ),
                SizedBox(height: 2,),
                Text("Email",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(74, 213, 205, 0.1),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10,),
                  padding: EdgeInsets.symmetric(vertical: 7,horizontal: 25),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Email"
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
                SizedBox(height: 2,),
                Text("Gender",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                GenderSelect(),
                SizedBox(height: 2,),
                Text("Date of Birth",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                InkWell(
                  onTap: (){
                    _selectDate(context);
                  },
                  child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(74, 213, 205, 0.1),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10,),
                      padding: EdgeInsets.symmetric(vertical: 7,horizontal: 25),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              birthDate.day.toString()+"/"+birthDate.month.toString()+"/"+birthDate.year.toString(),
                              style: TextStyle(color: Colors.black,fontSize: 16,),
                            ),
                            Icon(Icons.calendar_month,color: Colors.grey,size: 24,)
                          ],
                        ),
                      )
                  ),
                ),
                SizedBox(height: 5,),
                Text("Other",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 22),),
                OtherEdit(size),
                SizedBox(height: 5,),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: size.height*0.07,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(74, 213, 205, 1),
                        borderRadius: BorderRadius.circular(100)
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10,),
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 25),
                    child: Center(
                      child: Text("Save",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 22
                        ),),
                    ),
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }

  GenderSelect() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: (){
              setState(() {
                selectGen=0;
              });
            },
            child: Container(
              height: 60,
              margin: EdgeInsets.all(5),
              color: (selectGen==0)?Color.fromRGBO(74, 213, 205, 1):Color.fromRGBO(74, 213, 205, 0.1),
              child: Center(
                child: Text("Male",
                  style: TextStyle(color: Colors.black,fontSize: 16,),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: (){
              setState(() {
                selectGen=1;
              });
            },
            child: Container(
              height: 60,
              margin: EdgeInsets.all(5),
              color: (selectGen==1)?Color.fromRGBO(74, 213, 205, 1):Color.fromRGBO(74, 213, 205, 0.1),
              child: Center(
                child: Text("Female",
                  style: TextStyle(color: Colors.black,fontSize: 16,),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: (){
              setState(() {
                selectGen=2;
              });
            },
            child: Container(
              height: 60,
              margin: EdgeInsets.all(5),
              color: (selectGen==2)?Color.fromRGBO(74, 213, 205, 1):Color.fromRGBO(74, 213, 205, 0.1),
              child: Center(
                child: Text("Other",
                  style: TextStyle(color: Colors.black,fontSize: 16,),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  OtherEdit( var size) {
    return Container(
      width: double.infinity,
      height: size.height*0.24,
      child: GridView(
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            mainAxisExtent: size.height*0.12
        ),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            height: size.height*0.12,
            decoration: BoxDecoration(
                color: Color.fromRGBO(74, 213, 205, 0.1)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Medicine per day",
                  style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w600),
                ),
                TextField(
                  controller: _mpdController,
                  style: TextStyle(color: Colors.black,fontSize: 18,),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "00"
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            height: size.height*0.12,
            decoration: BoxDecoration(
                color: Color.fromRGBO(74, 213, 205, 0.1)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Diagnosis per week",
                  style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w600),
                ),
                TextField(
                  controller: _dpwController,
                  style: TextStyle(color: Colors.black,fontSize: 18,),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "00"
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: ()=>_selectTimeG(context, ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              height: size.height*0.12,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(74, 213, 205, 0.1)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Get in bed",
                    style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w600),
                  ),
                  Text(gib.hour.toString()+":"+gib.minute.toString(),
                    style: TextStyle(color: Colors.black,fontSize: 18,),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: ()=>_selectTimeW(context, ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              height: size.height*0.12,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(74, 213, 205, 0.1)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Wake up",
                    style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w600),
                  ),
                  Text(wu.hour.toString()+":"+wu.minute.toString(),
                    style: TextStyle(color: Colors.black,fontSize: 18,),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




