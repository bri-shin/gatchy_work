import 'package:flutter/material.dart';
import 'package:gatchy_work/models/goal.dart';

class GoalTile extends StatelessWidget {
  final Goal goal;
  GoalTile({this.goal});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
                leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.red[goal.value],
            ),
            title: Text(goal.name),
            subtitle: Text('It\'s been ${goal.gatchyDay} days!'),
            )
          )
      );
  }
}