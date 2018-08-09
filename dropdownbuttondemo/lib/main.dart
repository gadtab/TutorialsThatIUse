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
  String _value = null;
  List<String> _values = new List<String>();


  @override
  void initState() {
    _values.addAll(["Gadi", "Andi", "Tamar", "Lia"]);
    _value = _values[0];
  }

  void _onChanged(String value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('DropDownButton Demo'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new DropdownButton(
                value: _value,
                items: _values.map((String value){
                  return new DropdownMenuItem(
                    value: value,
                    child: new Row(
                      children: <Widget>[
                        new Icon(Icons.home),
                        new Text('Person: $value'),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String value){_onChanged(value);},
              )
            ],
          ),
        ),
      ),
    );
  }
}
