import 'package:flutter/material.dart';
import 'package:loginapp/settings.dart';
import 'package:loginapp/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _title = 'Please Login';
  Widget _screen;
  Login _login;
  Settings _settings;
  bool _authenticated;

  _MyAppState() {
    _login = new Login(onSubmit: (){onSubmit();});
    _settings = new Settings();
    _screen = _login;
    _authenticated = false;
  }

  void onSubmit() {
    print('Login with: ' + _login.username + ' ' + _login.password);
    if (_login.username == 'Gadi' && _login.password == 'zaq12wsx') {
      _setAuthenticated(true);
    }
  }

  void _goHome() {
    print('go home');

    setState(() {
      if(_authenticated) {
        _screen = _settings;
      }
      else {
        _screen = _login;
      }
    });
  }

  void _logout() {
    print('log out');
    _setAuthenticated(false);
  }

  void _setAuthenticated(bool auth) {
    setState(() {
      if(auth) {
        _screen = _settings;
        _title = 'Welcome '  + _login.username;
        _authenticated = true;
      }
      else {
        _screen = _login;
        _title = 'Please Login';
        _authenticated = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp (
      title: 'Login Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.home),
                onPressed: (){_goHome();}
            ),
            new IconButton(
                icon: new Icon(Icons.exit_to_app),
                onPressed: (){_logout();}
            ),
          ],
        ),
        body: _screen,
      ),
    );
  }
}