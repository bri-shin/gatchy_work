import "package:flutter/material.dart";
import 'package:gatchy_work/shared/date.dart';
import 'package:gatchy_work/shared/iconPicker.dart';


class CreateHabit extends StatefulWidget {
  @override
  _CreateHabitState createState() => _CreateHabitState();
}

class _CreateHabitState extends State<CreateHabit> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("gatchY", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300, color: Colors.black ) ),
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      style: TextStyle(fontSize: 40.0),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Habit Name'
                      ),
                    ),
                    TextField(
                      style: TextStyle(fontSize: 20.0),
                      maxLength: 100,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Description'
                      ),
                    ),
                    DateRange(),
                    IconPicker()
                  ],
                ) ,
              )
            ),
          ],
        )
      )
    );
  }
}