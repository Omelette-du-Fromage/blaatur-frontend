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
      title:'Flutter Web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      home: Scaffold(backgroundColor: Colors.blueGrey),
    );
  }
}
