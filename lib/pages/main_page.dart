import 'package:flutter/material.dart';
import '../components/input_field.dart';
import 'destination_page.dart';

class MainPage extends StatelessWidget {
  // This widget is the root of your application.
  final InputField inputFieldStartingPoint = InputField('Starting point');
  final InputField inputFieldBudget = InputField('Budget');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pic2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
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
                  inputFieldStartingPoint: inputFieldStartingPoint,
                  inputFieldBudget: inputFieldBudget)
            ],
          ),
        ),
      ),
    );
  }
}

class TravelForm extends StatelessWidget {
  const TravelForm({
    Key key,
    @required this.inputFieldStartingPoint,
    @required this.inputFieldBudget,
  }) : super(key: key);

  final InputField inputFieldStartingPoint;
  final InputField inputFieldBudget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        inputFieldStartingPoint,
        SizedBox(height: 10),
        inputFieldBudget,
        SizedBox(height: 20),
        RawMaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DestinationRoute(
                    startLocation: inputFieldStartingPoint.value),
              ),
            );
          },
          elevation: 2.0,
          fillColor: Colors.white,
          child: Icon(
            Icons.public,
            color: Colors.black,
            size: 60.0,
          ),
          padding: EdgeInsets.all(2.0),
          shape: CircleBorder(),
        ),
      ],
    );
  }
}
