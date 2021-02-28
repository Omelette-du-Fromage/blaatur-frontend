import 'dart:io';

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  String value;

  InputField() {
    value = "";
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: 300,
        child: new TextField(
            onChanged: (val) => value = val,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
                hintText: 'Starting point.')));
  }
}
