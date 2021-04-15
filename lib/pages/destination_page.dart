import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(DestinationRoute());

Future<http.Response> fetchTrip(
    String startLocation, List destinationsUsed) async {
  final response = await http.post(
    'https://blaatur-backend-staging.herokuapp.com/testing',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'place_from': startLocation,
      'destinations_used': destinationsUsed
    }),
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
  String destination;
  List destinationsUsed = [];

  @override
  void initState() {
    super.initState();
    response = fetchTrip(widget.startLocation, []);
  }

  List parseJSON(Map<String, dynamic> jsonData) {
    var legs = jsonData['trip']['legs'];
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
      'water': Icons.directions_boat,
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

  String getDestinationFromLegList(List legList) {
    var indexOfLastLeg = legList.length - 1;
    var indexOfDestination = legList[indexOfLastLeg].length - 2;
    destination = legList[indexOfLastLeg][indexOfDestination];
    return destination;
  }

  List getLegListFromJSON(Map<String, dynamic> dataman) {
    var legList = parseJSON(dataman);
    return legList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: ListView(shrinkWrap: true, children: [
          Center(
              child: FutureBuilder<http.Response>(
                  future: response,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var snapshotData = snapshot.data.body;
                      Map<String, dynamic> dataman = jsonDecode(snapshotData);
                      var legList = getLegListFromJSON(dataman);

                      destination = getDestinationFromLegList(legList);
                      destinationsUsed = dataman['destinations_used'];

                      return Column(children: [
                        SizedBox(height: 50),
                        Text(
                          destination,
                          key: Key('response-from-backend'),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Montserrat'),
                        ),
                        SizedBox(height: 50),
                        DataTable(
                          dataRowHeight: 60,
                          columns: [
                            DataColumn(label: Text('')),
                            DataColumn(label: Text('Klokken fra')),
                            DataColumn(label: Text('Fra')),
                            DataColumn(label: Text('Klokken til')),
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
                        SizedBox(height: 50),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                response = fetchTrip(
                                    widget.startLocation, destinationsUsed);
                              });
                            },
                            child: Text('Refresh')),
                        SizedBox(height: 50)
                      ]);
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

