import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SavedWords extends StatelessWidget {
  SavedWords({this.savedWords});

  final Set<WordPair> savedWords;

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Saved Suggestions'),
      ),
      body: new ListView(children: _getListTile(context)),
    );
  }

  List<Widget> _getListTile(BuildContext context) {
    return ListTile
        .divideTiles(
          context: context,
          tiles: _getTiles(),
        )
        .toList();
  }

  Iterable<ListTile> _getTiles() {
    return this.savedWords.map(
      (pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
  }
}
