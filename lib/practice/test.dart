import 'package:flutter/material.dart';
import 'calendar_container.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final words = generateWordPairs().take(10);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.orange),
        // home: RandomWords(key, words.toList()));
        home: CalendarContainer());
  }
}