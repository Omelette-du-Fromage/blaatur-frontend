import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  String value;
  String hintText;
  Key key;

  InputField({this.key, this.hintText = 'Hint Text', this.value = ''});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(1, 1, 1, 0.0),
      child: Container(
        width: 300,
        child: TextField(
          style: TextStyle(color: Colors.white),
          onChanged: (val) => value = val,
          onTap: () => {hintText = ' ', (context as Element).markNeedsBuild()},
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(1, 1, 1, 0.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.grey, width: 0.0),
              ),
              hintStyle: TextStyle(color: Colors.white),
              fillColor: Color.fromRGBO(1, 1, 1, 0.2),
              filled: true,
              hintText: hintText),
        ),
      ),
    );
  }
}
