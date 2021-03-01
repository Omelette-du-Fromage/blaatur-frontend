import 'package:flutter/material.dart';
import 'package:food_web/components/custom_slider.dart';
import '../components/input_field.dart';
import 'destination_page.dart';

class MainPage extends StatelessWidget {
  // This widget is the root of your application.
  InputField inputfield = new InputField();
  CustomSlider customSlider = new CustomSlider();

  @override
  Widget build(BuildContext context) {
    var _value = 0;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
          child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          inputfield,
          customSlider,
          new FlatButton(
            child: new Text("GO"),
            color: Colors.cyan,
            onPressed: () {
              print(inputfield.value);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DestinationRoute(
                    startLocation: inputfield.value +
                        "   " +
                        customSlider.value.toString(),
                  ),
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
