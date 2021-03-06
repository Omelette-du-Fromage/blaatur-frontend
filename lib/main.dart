import 'package:flutter/material.dart';
import 'pages/main_page.dart';

const _hostname = '0.0.0.0';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blåtur',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.blueGrey,
        primaryColor: Colors.amber,
      ),
      home: MainPage(),
    );
  }
}
  