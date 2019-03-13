import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  String _value = 'Hola!';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My App'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('Image Demo'),
              new Expanded(child: new Image.asset('images/images.jpg')),
              new Expanded(child: new Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrSmO4CyW8mKLJ2238N0JtF9W_AaaD3-vZERFSSpGa4WkomK9d'))
            ],
          ),
        ),
      ),
    );
  }
}
