import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:startup_namer/models/WordTileData.dart';
import 'package:startup_namer/widgets/SavedWords.dart';
import 'package:startup_namer/widgets/TileWithIcon.dart';

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new SavedWords(savedWords: _saved,);
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return new TileWithIcon(
      data: getTileData(alreadySaved, pair),
    );
  }

  WordTileData getTileData(bool alreadySaved, WordPair pair) {
    return alreadySaved
        ? new WordTileData(
            icon: Icons.favorite,
            color: Colors.red,
            onTap: () {
              setState(() {
                _saved.remove(pair);
              });
            },
            pair: pair)
        : new WordTileData(
            icon: Icons.favorite_border,
            onTap: () {
              setState(() {
                _saved.add(pair);
              });
            },
            pair: pair);
  }
}
