import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  CustomSlider({Key key}) : super(key: key);
  double _currentSliderValue = 20;

  double get value {
    return _currentSliderValue;
  }

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Slider(
      min: 0,
      max: 100,
      value: widget._currentSliderValue,
      label: widget._currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          widget._currentSliderValue = value;
        });
      },
    ));
  }
}
