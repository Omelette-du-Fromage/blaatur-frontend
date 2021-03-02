import 'package:flutter/material.dart';
import '../components/input_field.dart';
import 'destination_page.dart';

class MainPage extends StatelessWidget {
  // This widget is the root of your application.
  final InputField inputFieldStartingPoint = InputField('Starting point');
  final InputField inputFieldBudget = InputField('Budget');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          inputFieldStartingPoint,
          inputFieldBudget,
          FlatButton(
            child: Text('GO'),
            color: Colors.cyan,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DestinationRoute(
                    startLocation: inputFieldStartingPoint.value
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
