import 'package:flutter/material.dart';

void main() {
  runApp(
    Center(
      child: new MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Hello Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Hello Flutter'),
        ),
        body: new Center(
          child: new RaisedButton(
              onPressed: null,
              child: new Text('Hello World'),),
        ),
      ),
    );
  }
}