import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class DateSelector extends StatefulWidget {
  DateSelector({Key key}) : super(key: key);
  DateTime currDate = DateTime.now();
  DateTime selectedDate = DateTime.now();

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  Future<void> _selectDate(BuildContext context) async {
    // ignore: omit_local_variable_types
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: widget.currDate,
      helpText: 'Velg dato for avreise',
      fieldHintText: 'Avreise dato',
      currentDate: widget.currDate,
      firstDate: widget.currDate,
      lastDate: DateTime(
          widget.currDate.year, widget.currDate.month + 1, widget.currDate.day),
    );

    if (picked != null && picked != widget.selectedDate) {
      setState(() {
        widget.selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: () => _selectDate(context),
      child: Icon(
        Icons.date_range,
        color: Colors.blue,
        size: 20.0,
      ),
    );
  }
}
