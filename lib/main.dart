import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as JSON;
import 'dart:io';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  String _value = 'Hola!';

  Map _countries = new Map();

  void _getData() async {
    var url = 'http://country.io/names.json';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() => _countries = JSON.jsonDecode(response.body));
      print("Loaded ${_countries.length} countries");
    }
  }

  @override
  Widget build(BuildContext context) {

    //_getData();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My App'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('Countries',
                  style: new TextStyle(fontWeight: FontWeight.bold)),
              new Expanded(
                  child: new ListView.builder(
                itemCount: _countries.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = _countries.keys.elementAt(index);
                  return new Row(
                    children: <Widget>[
                      new Text('${key} : '),
                      new Text(_countries[key])
                    ],
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _getData();
  }
}
