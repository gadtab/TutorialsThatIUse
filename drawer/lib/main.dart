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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Drawer Demo'),
      ),
      drawer: new Drawer(
        child: Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Text('Hello Drawer'),
              new RaisedButton(
                color: Colors.red,
                child: new Text('Close'),
                onPressed: (){Navigator.pop(context);},
              )
            ],
          ),
        ),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              new Text('Add Widgets here'),
            ],
          ),
        ),
      )
    );
  }
}