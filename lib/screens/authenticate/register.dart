import 'package:flutter/material.dart';
import 'package:gatchy_work/services/auth.dart';
import 'package:gatchy_work/shared/constants.dart';
import 'package:gatchy_work/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('Sign Up to Gatchy!'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Sign In"),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
        child: Form(
          // Validates the form inputs
          key: _formKey,
          child: Column(children: <Widget>[
            SizedBox(height: 20.0),
            TextFormField(
                decoration: textInputDecoration.copyWith(
                    hintText: 'Email', fillColor: Colors.red[50]),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                }),
            SizedBox(height: 20.0),
            TextFormField(
                decoration: textInputDecoration.copyWith(
                    hintText: 'Password', fillColor: Colors.red[50]),
                obscureText: true,
                validator: (val) =>
                    val.length < 6 ? 'Password must be 6+ characters' : null,
                onChanged: (val) {
                  setState(() => password = val);
                }),
            SizedBox(height: 20.0),
            RaisedButton(
                color: Colors.red[600],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  // Validating form input
                  if (_formKey.currentState.validate()) {
                    setState(() => loading = true);
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Invalid Email';
                        loading = false;
                      });
                    }
                  }
                }),
            SizedBox(height: 12.0),
            Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0))
          ]),
        ),
      ),
    );
  }
}
