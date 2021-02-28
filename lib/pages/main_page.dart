import 'package:flutter/material.dart';
import '../components/input_field.dart';

class MainPage extends StatelessWidget {
  // This widget is the root of your application.
  InputField inputfield = new InputField();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Web',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.amber,
        ),
        home: Scaffold(
          backgroundColor: Colors.blueGrey,
          body: Center(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              inputfield,
              new FlatButton(
                child: new Text("GO"),
                color: Colors.cyan,
                onPressed: () {
                  print(inputfield.value);
                },
              ),
            ],
          )),
        ));
  }
}
