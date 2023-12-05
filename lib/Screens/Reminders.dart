import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:table_calendar/table_calendar.dart';




class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  TimeOfDay reminderTime=TimeOfDay.now();

  DateTime _focusedDate=DateTime.now();
  DateTime? _selectedDate;
  late ScrollController scrollController;
  CalendarFormat _calendarFormat=CalendarFormat.week;

  String medName="",medPower="",medQuantity="";
  var _isExpanded=false;

  var visible=0;




  Map<String,List> dateEvents={};
  List<Map> reminderList=[];






  @override
  void initState() {
    // TODO: implement initState

    _selectedDate=_focusedDate;
    _isExpanded=false;
    super.initState();

  }
  var size;


  @override
  Widget build(BuildContext context) {

    size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(19, 35, 70, 1),
        leadingWidth: 80,
        leading: IconButton(
          color: Colors.white,

          icon: Icon(Icons.arrow_back_ios,size: 25,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions:<Widget> [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIapXoWZ5z2gQlp9969vhAzkddlJCjxUVvLg&usqp=CAU',)
            ),
          )
        ],


      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: Color.fromRGBO(19, 35, 70, 1),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 2),
              curve: Curves.easeInOut,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [ (!_isExpanded)?
                    TableCalendar(
                    rowHeight: 60,
                    calendarFormat: CalendarFormat.week,
                    daysOfWeekHeight: 20,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    firstDay: DateTime(2022),
                    lastDay: DateTime(2024),
                    focusedDay: _focusedDate,
                    onDaySelected: (selectedDate,focusedDay){
                      if(!isSameDay(_selectedDate, selectedDate)){
                        setState(() {
                          _selectedDate=selectedDate;
                          _focusedDate=focusedDay;
                        });
                      }
                    },
                    selectedDayPredicate: (day){
                      return isSameDay(_selectedDate,day);
                    },
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(color: Colors.white,fontSize: 18),
                      leftChevronIcon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 18,),
                      rightChevronIcon: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 18,),
                      leftChevronMargin: EdgeInsets.only(left: 70),
                      rightChevronMargin: EdgeInsets.only(right: 70),
                    ),
                    calendarStyle: CalendarStyle(


                      selectedTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700
                      ),
                      weekendTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700
                      ),
                      defaultTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700
                      ),
                      todayTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700
                      ),
                      todayDecoration: BoxDecoration(
                        color: Color.fromRGBO(42, 207, 198, 0.5),
                        shape: BoxShape.rectangle,

                      ),
                      selectedDecoration: BoxDecoration(
                          color: Color.fromRGBO(42, 207, 198, 1),
                          shape: BoxShape.rectangle


                      ),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(

                        weekdayStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        ),
                        weekendStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        )
                    ),

                  ):
                    TableCalendar(
                    rowHeight: 50,
                    calendarFormat: CalendarFormat.month,

                    startingDayOfWeek: StartingDayOfWeek.monday,
                    firstDay: DateTime(2022),
                    lastDay: DateTime(2024),
                    focusedDay: _focusedDate,
                    onDaySelected: (selectedDate,focusedDay){
                      if(!isSameDay(_selectedDate, selectedDate)){
                        setState(() {
                          _selectedDate=selectedDate;
                          _focusedDate=focusedDay;
                        });
                      }
                    },
                    selectedDayPredicate: (day){
                      return isSameDay(_selectedDate,day);
                    },
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(color: Colors.white,fontSize: 18),
                      leftChevronIcon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 18,),
                      rightChevronIcon: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 18,),
                      leftChevronMargin: EdgeInsets.only(left: 70),
                      rightChevronMargin: EdgeInsets.only(right: 70),
                    ),
                    calendarStyle: CalendarStyle(

                      selectedTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700
                      ),
                      weekendTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700
                      ),
                      defaultTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700
                      ),
                      todayTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700
                      ),
                      todayDecoration: BoxDecoration(
                        color: Color.fromRGBO(42, 207, 198, 0.5),
                        shape: BoxShape.rectangle,

                      ),
                      selectedDecoration: BoxDecoration(
                          color: Color.fromRGBO(42, 207, 198, 1),
                          shape: BoxShape.rectangle


                      ),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        ),
                        weekendStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        )
                    ),

                  ),

                    GestureDetector(

                      onVerticalDragUpdate: (DragUpdateDetails details){
                        setState(() {
                          if(_isExpanded)
                            _isExpanded=false;
                          else
                            _isExpanded=true;
                        });
                      },
                      child: Container(
                        width: size.width,

                        child: Icon(
                          (_isExpanded)?Icons.arrow_drop_up:Icons.arrow_drop_down,size: 30,color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),

            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Container(
                  child: ListView.builder(
                    itemCount: reminderList.length+1,
                    
                    itemBuilder: (context,index){
                      return Container(
                        margin: EdgeInsets.all(10),
                        height: size.height*0.15,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(249, 249, 249, 1),
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                children: [

                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
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
                onTap: ()=>showModalBottomSheet(
                    context: context,
                    builder: (context)=> buildSheet()
                ),
              ),
            )

          ],
        ),
      ),

    );

  }

  Widget buildSheet() {

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
                          Icon(Icons.apple,size: 45,color: (visible==0)?Colors.white:Color.fromRGBO(42, 207, 198, 1)),
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
                          Icon(Icons.apple,size: 45,color: (visible==1)?Colors.white:Color.fromRGBO(42, 207, 198, 1)),
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
                          Icon(Icons.apple,size: 45,color: (visible==2)?Colors.white:Color.fromRGBO(42, 207, 198, 1)),
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
                          Icon(Icons.apple,size: 45,color: (visible==3)?Colors.white:Color.fromRGBO(42, 207, 198, 1)),
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
                    Map<String,String> data={};

                    switch(visible)
                        {
                      case 0:
                        data.update('case', (value) => '0');
                        data.update('name', (value) => medName);
                        data.update('power', (value) => medPower);
                        data.update('quantity', (value) => medQuantity);
                        data.update('time', (value) => reminderTime.format(context).toString());
                        reminderList.add(data);
                        dateEvents.update(_selectedDate!.day.toString(), (value) => reminderList);
                        break;
                      case 1:
                        data.update('case', (value) => '1');
                        data.update('name', (value) => medName);
                        data.update('power', (value) => "");
                        data.update('quantity', (value) => "");
                        data.update('time', (value) => reminderTime.format(context).toString());
                        reminderList.add(data);
                        dateEvents.update(_selectedDate!.day.toString(), (value) => reminderList);
                        break;
                      case 2:
                        data.update('case', (value) => '2');
                        data.update('name', (value) => medName);
                        data.update('power', (value) => "");
                        data.update('quantity', (value) => "");
                        data.update('time', (value) => reminderTime.format(context).toString());
                        reminderList.add(data);
                        dateEvents.update(_selectedDate!.day.toString(), (value) => reminderList);
                        break;
                      case 3:
                        data.update('case', (value) => '3');
                        data.update('name', (value) => medName);
                        data.update('power', (value) => "");
                        data.update('quantity', (value) => "");
                        data.update('time', (value) => reminderTime.format(context).toString());
                        reminderList.add(data);
                        dateEvents.update(_selectedDate!.day.toString(), (value) => reminderList);
                        break;

                    }

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
