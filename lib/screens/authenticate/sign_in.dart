import "package:flutter/material.dart";
import 'package:gatchy_work/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('Welcome to Gatchy!'), 
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
        child: RaisedButton(
          child: Text('Sign In Anonymously'),
          onPressed: () async {
            dynamic result = await _auth.signInAnonymous();
            if(result == null){
              print('error signing in');
            } else {
              print('signed in');
              print(result.uid);
            }
          },),
      ),
    );
  }
}
