import 'package:flutter/material.dart';
import 'package:food_web/components/custom_slider.dart';
import '../components/input_field.dart';
import 'destination_page.dart';

class MainPage extends StatelessWidget {
  // This widget is the root of your application.
  InputField inputFieldStartingPoint = new InputField("Starting point");
  InputField inputFieldBudget = new InputField("Budget");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
          child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          inputFieldStartingPoint,
          inputFieldBudget,
          new FlatButton(
            child: new Text("GO"),
            color: Colors.cyan,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DestinationRoute(
                    startLocation: inputFieldStartingPoint.value +
                        "   " +
                        inputFieldBudget.value,
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
