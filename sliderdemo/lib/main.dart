import 'package:flutter/material.dart';

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
  bool _value = false;

  void _onChanged(bool value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Switch Demo'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Switch(value: _value, onChanged: (bool value){_onChanged(value);}),
              new SwitchListTile(
                title: new Text('Click me'),
                activeColor: Colors.red,
                secondary: const Icon(Icons.home),
                value: _value,
                onChanged: (bool value){_onChanged(value);},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
