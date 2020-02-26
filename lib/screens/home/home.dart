import 'package:flutter/material.dart';
import 'package:gatchy_work/screens/home/setting_form.dart';
import 'package:gatchy_work/services/auth.dart';
import 'package:gatchy_work/services/database.dart';
import 'package:provider/provider.dart';
import 'package:gatchy_work/screens/home/goal_list.dart';
import 'package:gatchy_work/models/goal.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Goal>>.value(
      value: DatabaseService().goals,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Gatchy'),
            backgroundColor: Colors.red,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
              FlatButton.icon(
                icon: Icon(Icons.settings),
                label: Text('settings'),
                onPressed: () => _showSettingsPanel(),
              )
            ],
          ),
        body: GoalList(),
        ),
    );
  }
}
