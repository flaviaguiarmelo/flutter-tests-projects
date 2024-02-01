import 'package:flutter/material.dart';
import 'package:flutter_codelab_secondapp/app_state.dart';
import 'package:flutter_codelab_secondapp/favorites_page.dart';
import 'package:flutter_codelab_secondapp/generator_page.dart';

class Routes {
  static Widget selectedPage(AppState appState, int index) {
    switch (index) {
      case 0:
        return const GeneratorPage();
      case 1:
        return const FavoritesPage();
      default:
        throw UnimplementedError('no widget for $index');
    }
  }

  static NavigationRail navigationRail(int index, constraints,
      {void Function(int)? onDestinationSelected}) {
    return NavigationRail(
      extended: constraints.maxWidth >= 600,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.favorite),
          label: Text('Favorites'),
        ),
      ],
      selectedIndex: index,
      onDestinationSelected: onDestinationSelected,
    );
  }
}
