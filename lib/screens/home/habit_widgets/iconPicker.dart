import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';


class IconPicker extends StatefulWidget {
  @override
  _IconPickerState createState() => _IconPickerState();
}

class _IconPickerState extends State<IconPicker> {
Widget _icon;
  
_pickIcon() async {
  IconData icon = await FlutterIconPicker.showIconPicker(context,
    iconSize: 40,
    iconPickerShape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    title: Text('Icon',
        style: TextStyle(fontWeight: FontWeight.bold)),
    closeChild: Text(
        'Close',
        textScaleFactor: 1.25,
    ),
    searchHintText: 'Search icon...',
    noResultsText: 'No results for:'
  );
  
  _icon = Icon(icon);
  setState((){});
  
  debugPrint('Picked Icon:  $icon');
}
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: _icon != null ? _icon : Container()
          ),
          MaterialButton(
            onPressed: _pickIcon,
            height: 12.0,
            child: Text('Icon', style: TextStyle(color: Colors.white, fontSize: 15.0),),
            color: Colors.grey[700],
          ),          
        ])
    );
  }
}
