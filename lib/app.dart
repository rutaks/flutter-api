import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './views/item_detail.dart';
import './views/item_cell.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AppState();
  }
}

class AppState extends State<App> {
  var _isLoading = false;
  var videos;
  final String url = "API ROUTE";

  _fetchData() async {
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final map = json.decode(res.body);
      final jsonVideos = map["videos"];

      setState(() {
        _isLoading = false;
        videos = jsonVideos;
      });
    }
  }

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
                setState(() {
                  _isLoading = true;
                });
                _fetchData();
              },
            )
          ],
        ),
        body: Center(
          child: _isLoading
              ? CircularProgressIndicator()
              : new ListView.builder(
                  itemCount: videos != null ? videos.length : 0,
                  itemBuilder: (context, i) {
                    final video = videos[i];
                    return FlatButton(
                      padding: EdgeInsets.all(0.0),
                      child: ItemCell(video),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => new ItemDetailPage(),
                          ),
                        );
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }
}
