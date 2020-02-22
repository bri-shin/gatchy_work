import "package:flutter/material.dart";
import 'package:gatchy_work/screens/authenticate/authenticate.dart';
import 'package:gatchy_work/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:gatchy_work/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Accessing user data from the provider
    final user = Provider.of<User>(context);
    
    // Return either Home or Authenticate

    // Not Authenticated = Null
    if (user == null) {
      return Authenticate();
    } else {  // Else = Authenticated / Login
      return Home();
    }
    
  }
}