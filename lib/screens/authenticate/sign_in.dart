import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:gatchy_work/services/auth.dart';
import 'package:gatchy_work/shared/constants.dart';
import 'package:gatchy_work/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  // Define form key (private)
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //local state variable - text field state
  String email = '';
  String password = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              title:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(
                  'assets/icons/goal.png',
                  fit: BoxFit.contain,
                  height: 32,
                )
              ]),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 150.0, horizontal: 50),
              child: Column(children: <Widget>[
                Text("Productivity as first Habit",
                    style: new TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 30.0,
                    )),
                SizedBox(height: 20.0),
                Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Email', fillColor: Colors.grey[50]),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          }),
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Password', fillColor: Colors.grey[50]),
                          validator: (val) => val.length < 6
                              ? 'Password must be 6+ characters'
                              : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          }),
                      SizedBox(height: 20.0),
                      RaisedButton(
                          color: Colors.grey[600],
                          child: Text(
                            'Let\'s Go!',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            // Validating form input
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'Incorrect Credentials';
                                  loading = false;
                                });
                              }
                            }
                          }),
                      SizedBox(height: 12.0),
                      Text(error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0)),
                      SizedBox(height: 20.0),
                      RichText(
                        text: new TextSpan(
                          children: [
                            new TextSpan(
                              text: 'Are you new to gatchY? ',
                              style: new TextStyle(color: Colors.black),
                            ),
                            new TextSpan(
                              text: ' Sign Up',
                              style: new TextStyle(color: Colors.pink[500]),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  widget.toggleView();
                                },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                          color: Colors.grey[600],
                          child: Text(
                            'SignIn with Google',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                              dynamic result = await _auth
                                  .signInWithGoogle();
                              if (result == null) {
                                setState(() {
                                  error = 'Incorrect Credentials';
                                  loading = false;
                                });
                              
                            }
                          }),
                    ])),
              ]),
            ),
          );
  }
}
