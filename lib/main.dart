import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  String _value = 'Hola!';

  final GlobalKey<ScaffoldState> _scafoldstate = new GlobalKey<ScaffoldState>();

  void _showBar() {
    _scafoldstate.currentState.showSnackBar(new SnackBar(
      content: new Text('Hello world'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scafoldstate,
      appBar: new AppBar(
        title: new Text('My App'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(_value),
              new RaisedButton(
                onPressed: _showBar,
                child: new Text('Click me'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
