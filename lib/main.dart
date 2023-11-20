import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_namer/my_app.dart';
import 'package:flutter_namer/util/word_pair_adapter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WordPairAdapter());
  await Hive.openBox<WordPair>("current");
  await Hive.openBox<List>("favorites");
  runApp(MyApp());
}
