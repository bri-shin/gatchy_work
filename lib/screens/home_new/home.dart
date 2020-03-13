import "package:flutter/material.dart";
import 'package:gatchy_work/models/HabitCardModel.dart';



class gatchyHome extends StatefulWidget {
  @override
  _gatchyHomeState createState() => _gatchyHomeState();
}

class _gatchyHomeState extends State<gatchyHome> with TickerProviderStateMixin{

  var appColors = [Color.fromRGBO(231, 129, 109, 1.0),Color.fromRGBO(99, 138, 223, 1.0), Color.fromRGBO(111, 194, 173, 1.0)];
  var cardIndex = 0;
  ScrollController scrollController;
  var currentcolor = Colors.white;

  var habitList = [HabitCardModel("Workout", Icons.directions_run, 45, 27), HabitCardModel("Read", Icons.chrome_reader_mode , 45, 27), HabitCardModel("Save", Icons.monetization_on , 45, 27)];


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("gatchY", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300, color: Colors.black ) ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:25.0),
            child: Icon(Icons.calendar_today, color: Colors.black,),
          ),
        ],
        elevation: 0.0,
      ),
      body: new Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Icon(Icons.account_circle, size: 45.0, color: Colors.black,),
                    ),
                    Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 12.0),
                    child: Text("Hello, Trigggy.", style: TextStyle(fontSize: 30.0, color: Colors.grey[800]),),
                    ),
                    Text("Looks like you're happy.", style: TextStyle(fontSize: 16.0, color: Colors.grey[600])),
                    SizedBox(height: 5),
                    Text("You have 2 habits to go today.", style: TextStyle(fontSize: 16.0, color: Colors.grey[600]))
                  ],
                  ),
                )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
                    child: Text("Today : MARCH 12, 2020", style: TextStyle(color: Colors.black),),
                    ),
                  Container(
                    height: 350.0,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, position) {
                        return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Container(
                                width: 250.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Icon(habitList[position].icon, color: appColors[position],),
                                          Icon(Icons.more_vert, color: Colors.grey),
                                        ],),),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                                            child: Text("${habitList[position].habitTitle}", style: TextStyle(fontSize: 30.0),),
                                            ),
                                          Padding(
                                            padding:const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                              Text("\$ ${habitList[position].moneyEarned} earned", style: TextStyle(color: Colors.grey[800],),),
                                              Text("\$ ${habitList[position].streak} Days", style: TextStyle(color: Colors.grey[800],),)
                                                ],),
                                            ),
                                        ],
                                        )
                                      )
                                  ],
                                  )
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                                ),
                            )
                            ),
                            onHorizontalDragEnd: (details) {
                              
                            }
                          ,);
                      }
                      

                      ,)
                  )
                ],)
          ],)
      )
    );
  }
}