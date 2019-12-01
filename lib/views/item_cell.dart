import 'package:flutter/material.dart';

class ItemCell extends StatelessWidget {
  final item;
  ItemCell(this.item);

  @override
  Widget build(BuildContext context) {
    var channel = item["channel"];

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(item["imageUrl"]),
              Container(height: 10.0),
              Text(
                item["name"],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Container(height: 12.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 20.0,
                              backgroundImage:
                                  NetworkImage(channel["profileImageUrl"]),
                              backgroundColor: Colors.transparent,
                            ),
                            Text(
                              "  ${channel["name"]}",
                              style: TextStyle(
                                  color: Color.fromRGBO(12, 12, 12, 0.5)),
                            ),
                          ],
                        )
                      ],
                    ),
                    Text(
                      "${item['numberOfViews']} Views",
                      style: TextStyle(color: Color.fromRGBO(12, 12, 12, 0.5)),
                    ),
                  ],
                ),
              ),
              Divider(),
            ],
          ),
        )
      ],
    );
    ;
  }
}
