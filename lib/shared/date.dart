import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flutter/material.dart';


class DateRange extends StatefulWidget {
  @override
  _DateRangeState createState() => _DateRangeState();
}

class _DateRangeState extends State<DateRange> {

  List<String> _habitDates = [];
  var finalDate;
  
  _pickDate() async {
    
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: new DateTime.now(),
        initialLastDate: (new DateTime.now()),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030),
    );
    if (picked != null && picked.length == 2) {
        _habitDates = [];
      picked.forEach((date) {
        finalDate = "${date.day}-${date.month}-${date.year}";
        _habitDates.add(finalDate.toString());
        print(_habitDates);
        }
      );
      
    }


    setState((){});
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MaterialButton(
        color: Colors.grey[700],
        onPressed: _pickDate,
        child: Text("Pick date range", style: TextStyle(color: Colors.white),)
        ),
        Text(_habitDates.length != 0  && _habitDates.length == 2 ? _habitDates[0] + " to " + _habitDates[1] : "Pick Date", style: TextStyle(fontSize: 20.0)),
      ],
    );
  }
}