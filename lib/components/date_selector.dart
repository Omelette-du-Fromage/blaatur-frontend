import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class DateSelector extends StatefulWidget {
  DateSelector({Key key}) : super(key: key);
  DateTime currDate = DateTime.now();
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  Future<void> _selectDate(BuildContext context) async {
    // ignore: omit_local_variable_types
    final DateTimeRange picked = await showDateRangePicker(
      context: context,
      firstDate: widget.currDate,
      helpText: 'Velg dato til og dato hjem',
      fieldStartHintText: 'Dato til',
      fieldEndHintText: 'Dato hjem',
      currentDate: widget.currDate,
      lastDate: DateTime(
          widget.currDate.year, widget.currDate.month + 1, widget.currDate.day),
    );

    if (picked != null &&
        (picked != widget.toDate || picked != widget.toDate)) {
      setState(() {
        widget.fromDate = picked.start;
        widget.toDate = picked.end;
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
