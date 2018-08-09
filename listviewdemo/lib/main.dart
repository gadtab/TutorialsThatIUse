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
  List<bool> _data = new List<bool>();

  @override
  void initState() {
    super.initState();
    setState(() {
      for(int i = 0; i < 1000; i++) {
        _data.add(false);
      }
    });
  }

  void _onChanged(bool value, int index) {
    setState(() {
      _data[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ListView Demo'),
      ),
      body: new ListView.builder(
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index){
          return new Card(
            child: new Container(
              padding: new EdgeInsets.all(5.0),
              child: new Column(
                children: <Widget>[
                  new Text('This is item $index'),
                  new CheckboxListTile(
                    value: _data[index],
                    controlAffinity: ListTileControlAffinity.leading,
                    title: new Text('Click me item $index'),
                    onChanged: (bool value){_onChanged(value, index);},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
