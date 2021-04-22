import 'dart:html';
import 'dart:math';
import 'package:Blaatur/components/date_selector.dart';
import 'package:flutter/material.dart';
import '../components/input_field.dart';
import 'destination_page.dart';

class MainPage extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: randomBackground(),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: <Widget>[
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
                child: Image.asset(
              'assets/images/EnTur.png',
              width: 150,
              color: Colors.blueGrey,
            )),
          ),
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 150),
                Text(
                  'Lyst til å reise, men ikke vet hvor du vil dra?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 10),
                Text(
                  'Velg hvor du vil reise fra og trekk en tilfeldig tur!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 200),
                TravelForm(
                    inputFieldStartingPoint: InputField(
                        key: Key('inputField_main'),
                        hintText: 'Bergen',
                        value: 'Bergen'),
                    callback: callback),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  AssetImage randomBackground() {
    var base_path = 'assets/images/pic';
    var rand = Random();
    var img = rand.nextInt(3) + 1;
    return AssetImage(base_path + img.toString() + '.jpg');
  }

  final callback = (context, inputFieldStartingPoint) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              DestinationRoute(startLocation: inputFieldStartingPoint.value),
        ),
      );
}

class TravelForm extends StatelessWidget {
  const TravelForm(
      {Key key,
      @required this.inputFieldStartingPoint,
      @required this.callback})
      : super(key: key);

  final InputField inputFieldStartingPoint;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        inputFieldStartingPoint,
        SizedBox(height: 10),
        DateSelector(key: Key('dateSelector_main')),
        SizedBox(height: 10),
        RawMaterialButton(
          key: Key('go_button_main_page'),
          onPressed: () {
            callback(context, inputFieldStartingPoint);
          },
          elevation: 2.0,
          fillColor: Colors.white,
          padding: EdgeInsets.all(2.0),
          shape: CircleBorder(),
          child: Icon(
            Icons.public,
            color: Colors.black,
            size: 60.0,
          ),
        ),
      ],
    );
  }
}
