import 'package:flutter/material.dart';

const _hostname = '0.0.0.0';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
              new Container(
                  width: 300,
                  child: new TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none,
                          hintText: 'Starting point.'))),
              new FlatButton(
                child: new Text("GO"),
                color: Colors.cyan,
                onPressed: () {},
              ),
            ],
          )),
        ));
  }
}
