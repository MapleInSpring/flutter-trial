import 'package:flutter/material.dart';
import 'package:startup_namer/widgets/RandomWords.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Welcome to Flutter',
        home: new RandomWords());
  }
}
