import 'package:flutter/material.dart';

class DestinationRoute extends StatefulWidget {
  String startLocation;

  DestinationRoute({Key key, String startLocation}) : super(key: key) {
    this.startLocation = startLocation;
  }

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
              child: Text(widget.startLocation),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Go back"),
            ),
          ],
        ),
      ),
    );
  }
}
