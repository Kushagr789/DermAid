import 'package:flutter/material.dart';

class DoctorSearch extends StatefulWidget {
  const DoctorSearch({super.key});

  @override
  State<DoctorSearch> createState() => _DoctorSearchState();
}

class _DoctorSearchState extends State<DoctorSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(

        slivers: [
          SliverAppBar(
            leadingWidth: 80,
            leading: IconButton(onPressed: (){},
                icon: Icon(Icons.menu,color: Colors.white,size: 40,)
            ),
            centerTitle: true,
            title: Text(
              "Hello Kush!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(right: 20),
                child: CircleAvatar(
                    backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIapXoWZ5z2gQlp9969vhAzkddlJCjxUVvLg&usqp=CAU',)
                ),
              )
            ],
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Color.fromRGBO(19, 35, 70, 1),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Container(
                width: double.maxFinite,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                margin: EdgeInsets.only(left: 25,right: 25,bottom: 15,top: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
                        ),
                        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),

                          child: TextField(
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(128, 119, 137, 1)
                            ),
                            decoration: InputDecoration(

                              hintText: "Search Doctor",
                                border: InputBorder.none,

                              hintStyle: TextStyle(
                                color: Color.fromRGBO(128, 119, 137, 1),
                              )
                            ),

                        ),
                      ),
                      flex: 8,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(74, 213, 205, 1),
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                        ),
                        child: Center(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                      flex: 2,
                    )
                  ],
                  
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(

              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    color: Color.fromRGBO(19, 35, 70, 1),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(

                      padding: EdgeInsets.only(left: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Let's find",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 34,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text("your top doctor!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 34,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ),
                  )

                ],
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                return ListTile(
                  leading: Container(
                      padding: EdgeInsets.all(8),
                      width: 100,
                      child: Placeholder()),
                  title: Text('Place ${index + 1}', textScaleFactor: 2),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
