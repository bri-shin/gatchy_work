import 'package:flutter/material.dart';
import 'package:gatchy_work/models/user.dart';
import 'package:gatchy_work/screens/wrapper.dart';
import 'package:gatchy_work/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      // creating an instance of authservice and accessing 'user' stream
      value: AuthService().user,
      child: MaterialApp(home: Wrapper()),
    );
  }
}
