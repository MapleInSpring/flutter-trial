import 'package:flutter/material.dart';
import 'package:startup_namer/models/WordTileData.dart';

class TileWithIcon extends StatelessWidget {
  TileWithIcon({this.data});

  final WordTileData data;

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(
        data.pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        data.icon,
        color: data.iconColor,
      ),
      onTap: data.onTap,
    );
  }
}