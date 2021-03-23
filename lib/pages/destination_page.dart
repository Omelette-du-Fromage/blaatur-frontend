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
  Set<String> destinations = {};

  @override
  void initState() {
    super.initState();
    response = fetchTrip(widget.startLocation);
  }

  List parseJSON(Map<String, dynamic> jsonData) {
    //var trip = jsonData['data']['trip'];
    //var tripPatterns = trip['tripPatterns'];
    //var legs = tripPatterns[0]['legs'];
    var legs = jsonData['legs'];
    var leg_list = [];

    legs.forEach((leg) {
      var startTime = DateTime.parse(leg['expectedStartTime']);
      var endTime = DateTime.parse(leg['expectedEndTime']);
      var transport_company = '';
      if (leg['line'] != null) {
        transport_company = leg['line']['authority']['name'];
      }
      leg_list.add([
        stringToIcon(leg['mode']),
        "${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}",
        leg['fromPlace']['name'],
        "${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}",
        leg['toPlace']['name'],
        transport_company,
      ]);
    });
    return leg_list;
  }

  Icon stringToIcon(String string) {
    var iconName = <String, IconData>{
      'foot': Icons.directions_walk,
      'air': Icons.airplanemode_off_rounded,
      'bus': Icons.directions_bus,
      'rail': Icons.directions_train,
      'tram': Icons.directions_transit_outlined
    }[string];
    return Icon(
      iconName,
      color: Colors.white,
      size: 24.0,
      semanticLabel: string,
    );
  }

  // Pretty print stolen from StackOverflow
  String getPrettyJSONString(jsonObject) {
    var encoder = JsonEncoder.withIndent('     ');
    return encoder.convert(jsonObject);
  }

  @override
  Widget build(BuildContext context) {
    //var responseman = fetchTrip(widget.startLocation);
    //responseman.then((value) => null);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: ListView(children: [
          Center(
              child: FutureBuilder<http.Response>(
                  future: response,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Map<String, dynamic> dataman =
                          jsonDecode(snapshot.data.body);
                      var legList = parseJSON(dataman);
                      var indexOfLastLeg = legList.length - 1;
                      var indexOfDestination =
                          legList[indexOfLastLeg].length - 2;
                      destinations
                          .add(legList[indexOfLastLeg][indexOfDestination]);
                      print(destinations);

                      return Column(children: [
                        DataTable(
                          dataRowHeight: 60,
                          columns: [
                            DataColumn(label: Text('')),
                            DataColumn(label: Text('Klokke fra')),
                            DataColumn(label: Text('Fra')),
                            DataColumn(label: Text('Klokka til')),
                            DataColumn(label: Text('Til')),
                            DataColumn(label: Text('Selskap')),
                          ],
                          rows: [
                            for (var leg in legList)
                              DataRow(
                                cells: [
                                  DataCell(
                                    leg[0],
                                  ),
                                  for (int i = 1; i < leg.length; i++)
                                    DataCell(
                                      Text(leg[i]),
                                    ),
                                ],
                              ),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                response = fetchTrip(widget.startLocation);
                              });
                            },
                            child: Text('Refresh'))
                      ]);
                      //return SelectableText(leg_list.toString());
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return Column(children: [CircularProgressIndicator()]);
                  })),
        ]),
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
