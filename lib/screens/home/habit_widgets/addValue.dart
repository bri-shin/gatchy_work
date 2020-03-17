import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class AddValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
            decoration: new InputDecoration(labelText: "Enter the value", hintText: "50.0"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
          );
  }
}