import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  CustomSlider({Key key}) : super(key: key);
  int _currentSliderValue = 100;

  int get value {
    return _currentSliderValue;
  }

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 600,
        child: Slider(
          min: 100,
          max: 10000,
          divisions: 100,
          activeColor: Colors.white,
          value: widget._currentSliderValue.toDouble(),
          label: widget._currentSliderValue.toString(),
          onChanged: (double value) {
            setState(() {
              widget._currentSliderValue = value.round();
            });
          },
        ));
  }
}
