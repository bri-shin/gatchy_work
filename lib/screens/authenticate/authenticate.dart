import 'package:flutter/material.dart';
import 'package:gatchy_work/screens/authenticate/sign_in.dart';
import 'package:gatchy_work/screens/authenticate/register.dart';

// Wrapper for changing between register and sign in

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }
  
  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView: toggleView );
    } else {
      return Register(toggleView: toggleView);
    }
  }
}