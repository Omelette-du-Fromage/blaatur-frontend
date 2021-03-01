import 'dart:io';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  String value;

  InputField(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        child: TextField(
            onChanged: (val) => value = val,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
                hintText: value)));
  }
}
