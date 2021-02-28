import 'package:flutter/material.dart';

class DestinationRoute extends StatefulWidget {
  DestinationRoute({Key key}) : super(key: key);

  @override
  _DestinationRouteState createState() => _DestinationRouteState();
}

class _DestinationRouteState extends State<DestinationRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              child: Text("Test"),
            )
          ],
        ),
      ),
    );
  }
}
