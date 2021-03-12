import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  String value;

  InputField(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        child: TextField(
            style: TextStyle(color: Colors.white),
            onChanged: (val) => value = val,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                ),
                hintStyle: TextStyle(color: Colors.white),
                fillColor: Color.fromRGBO(1, 1, 1, 0.2),
                filled: true,
                hintText: value)));
  }
}
