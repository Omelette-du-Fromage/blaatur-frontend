import 'package:flutter/material.dart';

class DestinationRoute extends StatefulWidget {
  final String startLocation;

  DestinationRoute({Key key, this.startLocation}) : super(key: key) {}

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
