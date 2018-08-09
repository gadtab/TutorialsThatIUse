import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

// WILL NOT CHANGE
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

// WILL CHANGE
class _MyAppState extends State<MyApp> {
  String _title = 'App Bar Demo';
  String _myState = 'NO STATE';

  void _pressed(String message) {
    setState(() {
      _myState = message;
    });

    print(_myState);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: _title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new Text('text'),
            new IconButton(
                icon: new Icon(Icons.add_alert),
                onPressed: () {_pressed('Alert Pressed');},
            ),
            new IconButton(
              icon: new Icon(Icons.print),
              onPressed: () {_pressed('Print Pressed');},
            ),
            new IconButton(
              icon: new Icon(Icons.people),
              onPressed: () {_pressed('People Pressed');},
            ),
            new RaisedButton(
              child: new Text('Button'),
              onPressed: () {_pressed('SUPER BUTTON OF DOOM');}
            ),
          ],
        ),
        body: new Container(
          padding: const EdgeInsets.all(32.0),
          child: new Center(
            child: new Text(_myState),
          ),
        ),
      ),
    );
  }
}