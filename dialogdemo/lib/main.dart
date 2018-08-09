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

enum Answer {YES, NO, MAYBE}

class _MyAppState extends State<MyApp> {
  String _answer = '';

  void _setAnswer(String value) {
    setState(() {
      //TODO - act on the answer
      _answer = value;
    });
  }

  Future<Null> _askUser() async {
    switch(
      await showDialog(
        context: context,
        builder: (BuildContext context) =>  new SimpleDialog(
          title: new Text('Do you like flutter?'),
          children: <Widget>[
            new SimpleDialogOption(
              onPressed: (){Navigator.pop(context, Answer.YES);},
              child: const Text('Yes!!!'),
            ),
            new SimpleDialogOption(
              onPressed: (){Navigator.pop(context, Answer.NO);},
              child: const Text('No :('),
            ),
            new SimpleDialogOption(
              onPressed: (){Navigator.pop(context, Answer.MAYBE);},
              child: const Text('...Maybe...'),
            ),
            new Icon(Icons.ac_unit),
          ],
        )
      )
    ) {
      case Answer.YES:
        _setAnswer('yes');
        break;
      case Answer.NO:
        _setAnswer('no');
        break;
      case Answer.MAYBE:
        _setAnswer('maybe');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SimpleDialog Demo'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              new Text('You answered $_answer'),
              new RaisedButton(
                child: new Text('Click me'),
                onPressed: (){_askUser();},
              ),
            ],
          ),
        ),
      )
    );
  }
}