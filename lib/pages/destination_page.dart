import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DestinationRoute extends StatefulWidget {
  final String startLocation;

  DestinationRoute({Key key, this.startLocation}) : super(key: key);

  @override
  _DestinationRouteState createState() => _DestinationRouteState();
}

class _DestinationRouteState extends State<DestinationRoute> {
  Future<http.Response> fetchTest() async {
    final response =
        await http.get('https://blaatur-backend-staging.herokuapp.com/testing');
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch from backend');
    }
    return response;
  }

  @override
  Widget build(BuildContext context) {
    fetchTest();
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
