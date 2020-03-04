import 'package:flutter/material.dart';
import 'package:gatchy_work/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> values = ['0', '1', '2', '3', '4'];

  // form values
  String _currentName;
  String _currentValue;
  int _currentImportance; 

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update your Gatchy Settings:',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Please Enter your Goal' :null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 20.0,),
          // dropdown
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentValue ?? '0', 
            items: values.map((value){
              return DropdownMenuItem(
                value: value,
                child: Text('$value values'),
                );
            }).toList(),
            onChanged: (val) => setState(() => _currentValue = val), 
          ),
          // value slider
          Slider(
            value: (_currentImportance ?? 100).toDouble(),
            activeColor: Colors.red[_currentImportance ?? 100],
            inactiveColor: Colors.white,
            min: 100,
            max: 900,
            divisions: 8,
            onChanged: (val) => setState(()=> _currentImportance = val.round()),
          ),
          RaisedButton(
            color: Colors.red,
            child: Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              print(_currentName);
              print(_currentValue);
              print(_currentImportance);
            },)
        ],
      )
      
    );
  }
}