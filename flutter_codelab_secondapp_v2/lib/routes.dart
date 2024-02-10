import 'package:flutter/material.dart';
import 'favorites_page.dart';
import 'generator_page.dart';

class Routes {
  static Widget selectedPage(int index) {
    switch (index) {
      case 0:
        return const GeneratorPage();
      case 1:
        return const FavoritesPage();
      default:
        throw UnimplementedError('no widget for $index');
    }
  }

  static NavigationRail navigationSideBar(int index, double maxWidth,
      {void Function(int)? onItemSelected}) {
    return NavigationRail(
      extended: maxWidth >= 650,
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
      onDestinationSelected: onItemSelected,
    );
  }

  static BottomNavigationBar navigationBottomBar(int index, {void Function(int)? onItemSelected}) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
      ],
      currentIndex: index,
      onTap: onItemSelected,
    );
  }
}
