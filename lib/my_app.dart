import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_namer/screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  // var _current = WordPair.random();

  WordPair get current {
    var ret = Hive.box<WordPair>("current").get("current");
    if (ret == null) {
      var wp = WordPair.random();
      Hive.box<WordPair>("current").put("current", wp);
      return wp;
    }
    return ret;
  }

  set current(WordPair c) {
    Hive.box<WordPair>("current").put("current", c);
  }

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  // var favorites = <WordPair>[];

  List<WordPair> get favorites {
    var ret = Hive.box<List>("favorites").get("favorites")?.cast<WordPair>();
    if (ret == null) {
      var l = <WordPair>[];
      Hive.box<List>("favorites").put("favorites", l);
      return l;
    }
    return ret;
  }

  set favorites(List<WordPair> l) {
    Hive.box<List>("favorites").put("favorites", l);
  }

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    favorites = favorites;
    notifyListeners();
  }
}
