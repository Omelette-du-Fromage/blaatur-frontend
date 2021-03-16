import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(DestinationRoute());

Future<http.Response> fetchTrip(String startLocation) async {
  final response = await http.post(
    'https://blaatur-backend-staging.herokuapp.com/testing',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'place_from': startLocation}),
  );
  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
  } else {
    throw Exception('Failed to fetch from backend');
  }
  return response;
}

class DestinationRoute extends StatefulWidget {
  final String startLocation;

  DestinationRoute({Key key, this.startLocation}) : super(key: key);

  @override
  _DestinationRouteState createState() => _DestinationRouteState();
}

class _DestinationRouteState extends State<DestinationRoute> {
  Future<http.Response> response;

  @override
  void initState() {
    super.initState();
    response = fetchTrip(widget.startLocation);
  }

  @override
  Widget build(BuildContext context) {
    //var responseman = fetchTrip(widget.startLocation);
    //responseman.then((value) => null);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder<http.Response>(
            future: response,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic> dataman = jsonDecode(snapshot.data.body);
                var trip = dataman['data']['trip'];
                var tripPatterns = trip['tripPatterns'];
                return SelectableText((tripPatterns).toString());
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}



    /*return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              child: Text(response),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}*/
