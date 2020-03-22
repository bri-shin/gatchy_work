import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                    
                    // Profile Image
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Icon(Icons.account_circle, size: 45.0, color: Colors.black,),
                    ),

                    // Name
                    
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 12.0),
                      child: Text("Hello, Brian.", style: TextStyle(fontSize: 30.0, color: Colors.grey[800]),),
                    ),
                    SizedBox(height: 20.0,),

                    // User Goal

                    Text("Goal", style: TextStyle(fontSize: 16.0, color: Colors.grey[600])),
                    Text("Become the best software engineer in the valley", style: TextStyle(fontSize: 20.0, color: Colors.grey[900])),
                    SizedBox(height: 30.0,),

                    // Interests

                    Text("Interests", style: TextStyle(fontSize: 16.0, color: Colors.grey[600])),
                    Text("Reading, Working Out, Cycling", style: TextStyle(fontSize: 20.0, color: Colors.grey[900])),
                    SizedBox(height: 30.0,),

                    // Highest Streak

                    Text("Streak", style: TextStyle(fontSize: 16.0, color: Colors.grey[600])),
                    Text("Read a book for 123 days", style: TextStyle(fontSize: 20.0, color: Colors.grey[900])),
                    SizedBox(height: 30.0,),

                    // Earned

                    Text("Total Earned", style: TextStyle(fontSize: 16.0, color: Colors.grey[600])),
                    Text("\$127", style: TextStyle(fontSize: 20.0, color: Colors.grey[900])),
                    SizedBox(height: 20.0,),

                    Divider(color: Colors.grey[500]),
                    SizedBox(height: 20.0,),

                    // Email
                    Text("Email", style: TextStyle(fontSize: 16.0, color: Colors.grey[600])),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      Text("brianshin@gatchy.io", style: TextStyle(fontSize: 20.0, color: Colors.grey[900])),
                      Text("change", style: TextStyle(fontSize:10.0, color: Colors.indigo[900]))
                    ],),
                    SizedBox(height: 30.0,),

                    // Password
                    Text("Password", style: TextStyle(fontSize: 16.0, color: Colors.grey[600])),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      Text("************", style: TextStyle(fontSize: 20.0, color: Colors.grey[900])),
                      Text("change", style: TextStyle(fontSize:10.0, color: Colors.indigo[900]))
                    ],),
                    SizedBox(height: 30.0,),

                    // Payment Information
                    Text("Card Information", style: TextStyle(fontSize: 16.0, color: Colors.grey[600])),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      Text("1234-****-****-1234", style: TextStyle(fontSize: 20.0, color: Colors.grey[900])),
                      Text("change", style: TextStyle(fontSize:10.0, color: Colors.indigo[900]))
                    ],),


                  ],
                  )
              ),)
          ],
        ),
      )
    );
  }
}