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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(_habitDates.length != 0  && _habitDates.length == 2 ? _habitDates[0] + " to " + _habitDates[1] : "Select Date", style: TextStyle(fontSize: 15.0)),
        MaterialButton(
        height: 12.0,
        color: Colors.grey[700],
        onPressed: _pickDate,
        child: Text("Date", style: TextStyle(color: Colors.white, fontSize: 15.0),)
        ),
      ],
    );
  }
}