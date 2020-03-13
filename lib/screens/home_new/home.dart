import "package:flutter/material.dart";


class gatchyHome extends StatefulWidget {
  @override
  _gatchyHomeState createState() => _gatchyHomeState();
}

class _gatchyHomeState extends State<gatchyHome> with TickerProviderStateMixin{
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
              )
          ],)
      )
    );
  }
}