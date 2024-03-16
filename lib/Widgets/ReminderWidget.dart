import 'package:derm_aid/Data/ReminderData.dart';
import 'package:derm_aid/Screens/Reminders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReminderWidget extends StatefulWidget {
  final int index;
  const ReminderWidget({super.key, required this.index});

  @override
  State<ReminderWidget> createState() => _ReminderWidgetState();
}

class _ReminderWidgetState extends State<ReminderWidget> {
  bool done=false;
  @override
  Widget build(BuildContext context) {
    final data=ReminderData.reminderList[widget.index];
    final size=MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(10),
      height: size.height*0.15,
      width: size.width,
      decoration: BoxDecoration(
        color: Color.fromRGBO(249, 249, 249, 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: (done)?Colors.green:Color.fromRGBO(220, 220, 220, 1),width: 2),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(220, 220, 220, 0.25),
            offset: Offset(4,4),
            blurRadius: 2,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            margin: EdgeInsets.all(3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(data['name']+(data.containsKey('power')?(" "+data['power']):""),
                  style: TextStyle(color: Colors.black,fontSize: 18 ,fontWeight: FontWeight.w600),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.alarm,color: Color.fromRGBO(84, 84, 84, 1),size: 16,),
                        Text(data['time'].toString(),style: TextStyle(fontSize: 16,color: Color.fromRGBO(84, 84, 84, 1)),)
                      ],
                    ),
                    (data['case']=="0")?Row(
                      children: [
                        Icon(Icons.circle,color: Color.fromRGBO(84, 84, 84, 1),size: 14,),
                        Text(data['quantity'].toString()+"Pills",style: TextStyle(fontSize: 16,color: Color.fromRGBO(84, 84, 84, 1)),)
                      ],
                    ):Text("Due Today",
                      style: TextStyle(color: Color.fromRGBO(84, 84, 84, 1),fontSize: 16,fontWeight: FontWeight.w300),
                    )
                  ],
                ),),

              ],
            ),
          )),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    done=false;
                  });
                },
                    icon: Icon(Icons.close,size: 30,color: Colors.red,)
                ),
                IconButton(onPressed: (){
                  setState(() {
                    done=true;
                  });
                },
                    icon: Icon(Icons.check,size: 30,color: Colors.green,)
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}

class AddReminder extends StatefulWidget {
  const AddReminder({super.key});

  @override
  State<AddReminder> createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  TimeOfDay reminderTime=TimeOfDay.now();
  DateTime? _selectedDate;
  late ScrollController scrollController;
  String medName="",medPower="",medQuantity="";
  var visible=0;
  Map<String,List> dateEvents={};
  List<Map> reminderList=[];
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return StatefulBuilder(builder: (BuildContext context,StateSetter setState)
    {
      return Container(
        padding: EdgeInsets.only(top: 50,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    setState((){
                      visible=0;
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: (visible==0)?Color.fromRGBO(42, 207, 198, 1):Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Color.fromRGBO(220, 220, 220, 1),width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(220, 220, 220, 0.25),
                          offset: Offset(4,4),
                          blurRadius: 2,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                            'assets/images/Pills.svg',
                          height: 35,
                          width: 35,
                            color: (visible==0)?Colors.white:Color.fromRGBO(42, 207, 198, 1)
                        ),
                        //Icon(Icons.apple,size: 45,color: (visible==0)?Colors.white:Color.fromRGBO(42, 207, 198, 1)),
                        Text('Pills',
                          style: TextStyle(
                              color: (visible==0)?Colors.white:Color.fromRGBO(42, 207, 198, 1),
                              fontSize: 14
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState((){
                      visible=1;
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: (visible==1)?Color.fromRGBO(42, 207, 198, 1):Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Color.fromRGBO(220, 220, 220, 1),width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(220, 220, 220, 0.25),
                            offset: Offset(4,4),
                            blurRadius: 2,
                          )
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          'assets/images/Ointment.svg',
                          height: 35,
                          width: 35,
                            color: (visible==1)?Colors.white:Color.fromRGBO(42, 207, 198, 1)
                        ),
                        //Icon(Icons.apple,size: 45,color: (visible==1)?Colors.white:Color.fromRGBO(42, 207, 198, 1)),
                        Text('Ointment',
                          style: TextStyle(
                              color: (visible==1)?Colors.white:Color.fromRGBO(42, 207, 198, 1),

                              fontSize: 14
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState((){
                      visible=2;
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: (visible==2)?Color.fromRGBO(42, 207, 198, 1):Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Color.fromRGBO(220, 220, 220, 1),width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(220, 220, 220, 0.25),
                            offset: Offset(4,4),
                            blurRadius: 2,
                          )
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          'assets/images/Consult.svg',
                          height: 35,
                          width: 35,
                          color: (visible==2)?Colors.white:Color.fromRGBO(42, 207, 198, 1),
                        ),
                        //Icon(Icons.apple,size: 45,color: (visible==2)?Colors.white:Color.fromRGBO(42, 207, 198, 1)),
                        Text('Consult',
                          style: TextStyle(
                              color: (visible==2)?Colors.white:Color.fromRGBO(42, 207, 198, 1),

                              fontSize: 14
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState((){
                      visible=3;
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: (visible==3)?Color.fromRGBO(42, 207, 198, 1):Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Color.fromRGBO(220, 220, 220, 1),width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(220, 220, 220, 0.25),
                            offset: Offset(4,4),
                            blurRadius: 2,
                          )
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          'assets/images/Scan.svg',
                          height: 35,
                          width: 35,color: (visible==3)?Colors.white:Color.fromRGBO(42, 207, 198, 1)
                        ),
                        //Icon(Icons.apple,size: 45,color: (visible==3)?Colors.white:Color.fromRGBO(42, 207, 198, 1)),
                        Text('Scan',
                          style: TextStyle(
                              color: (visible==3)?Colors.white:Color.fromRGBO(42, 207, 198, 1),

                              fontSize: 14
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20,),
              child: Column(
                children: [
                  TextField(
                    onChanged: (text){
                      medName=text;
                    },
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                        hintText: (visible==2)?"Doctor's Name":(visible==3)?'Custom Message':'Medicine Name'
                    ),
                  ),
                  (visible<1)?Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: TextField(
                          onChanged: (text){
                            medPower=text;
                          },
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          decoration: InputDecoration(
                            hintText: 'mg',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: TextField(
                          onChanged: (text){
                            medQuantity=text;
                          },
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: InputDecoration(
                            hintText: 'Quantity',
                          ),
                        ),
                      ),
                    ],
                  ):SizedBox(),
                ],
              ),

            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16
                          ),

                        ),
                        InkWell(
                          onTap: (){
                            showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now()
                            ).then((value) {
                              setState(() {
                                reminderTime=value!;
                              });
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Color.fromRGBO(42, 207, 198, 0.1)
                            ),
                            child: Text(
                              reminderTime.format(context).toString(),
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                  child: Container(
                    width: size.width,
                    height: size.height*0.08,
                    color: Color.fromRGBO(42, 207, 198, 1),
                    child: Center(
                      child: Text(
                        'Add Reminder',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ),
                  onTap: (){

                    Map<String,String> data1={
                      'case':"",
                      'name':"",
                      'power':"",
                      'quantity':"",
                      'time':"",
                    };

                    switch(visible)
                    {
                      case 0:
                        data1['case']='0';
                        data1['name'] =medName;
                        data1['power']=medPower;
                        data1['quantity']= medQuantity;
                        data1['time']= reminderTime.format(context).toString();
                        ReminderData.reminderList.add(data1);
                        //dateEvents.update(_selectedDate!.day.toString(), (value) => reminderList);
                        break;
                      case 1:
                        data1['case']='1';
                        data1['name']= medName;
                        data1['power']="";
                        data1['quantity']= "";
                        data1['time']= reminderTime.format(context).toString();

                        ReminderData.reminderList.add(data1);
                        //dateEvents.update(_selectedDate!.day.toString(), (value) => reminderList);
                        break;
                      case 2:
                        data1['case']='2';
                        data1['name']= medName;
                        data1['power']="";
                        data1['quantity']= "";
                        data1['time']= reminderTime.format(context).toString();

                        ReminderData.reminderList.add(data1);
                        //dateEvents.update(_selectedDate!.day.toString(), (value) => reminderList);
                        break;
                      case 3:
                        data1['case']='3';
                        data1['name']= medName;
                        data1['power']="";
                        data1['quantity']= "";
                        data1['time']= reminderTime.format(context).toString();
                        ReminderData.reminderList.add(data1);
                        //dateEvents.update(_selectedDate!.day.toString(), (value) => reminderList);
                        break;
                    }
                    print(ReminderData.reminderList);
                    Navigator.pop(context);
                  }
              ),
            )
          ],
        ),
      );
    }
    );
  }
}

