import 'package:flutter/material.dart';

class AddTeam extends StatefulWidget {
  @override
  _AddTeamState createState() => _AddTeamState();
}

class _AddTeamState extends State<AddTeam> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        style: TextStyle(fontSize: 15.0),
        decoration: InputDecoration(
          labelText: "Enter Team Name",
          border: InputBorder.none,
          hintText: 'Brian Shin'
        ),
      );
  }
}