import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2017),
        lastDate: new DateTime(2020),
    );

    if(picked != null && picked != _date) {
      print('Date selected ${_date.toString()}');
      setState(() {
        _date = picked;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: _time,
    );

    if(picked != null && picked != _time) {
      print('Time selected ${_time.toString()}');
      setState(() {
        _time = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('DatePicker Demo'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              new Text('Date selected ${_date.toString()}'),
              new RaisedButton(
                child: new Text('Select Date'),
                onPressed: (){_selectDate(context);},
              ),
              new Text(' '),
              new Text('Time selected ${_time.toString()}'),
              new RaisedButton(
                child: new Text('Select Time'),
                onPressed: (){_selectTime(context);},
              ),
            ],
          ),
        ),
      )
    );
  }
}