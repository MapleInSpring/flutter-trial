import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class WordTileData {
  IconData icon;
  MaterialColor iconColor;
  Function onTap;
  WordPair pair;

  WordTileData({icon, color, onTap, pair})
      : icon = icon,
        iconColor = color,
        onTap = onTap,
        pair = pair;
}
