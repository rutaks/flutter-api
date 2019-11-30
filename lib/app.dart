import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AppState();
  }
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("API APP"),
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                print("object");
              },
            )
          ],
        ),
      ),
    );
  }
}
