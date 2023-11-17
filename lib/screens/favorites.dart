import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_namer/my_app.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return SelectionArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('You have '
                '${appState.favorites.length} favorites:'),
          ),
          for (var f in appState.favorites)
            ListTile(
              title: Text(f.asLowerCase),
              leading: Icon(Icons.favorite),
            ),
        ],
      ),
    );
  }
}
