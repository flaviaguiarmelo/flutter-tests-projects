import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var theme = Theme.of(context);

    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('Nenhuma palavra favorita ainda :('),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('Você marcou '
              '${appState.favorites.length} palavras favoritas :)'),
        ),
        Expanded(
          child: ListView(
            children: appState.favorites.map((pair) {
              return Column(
                children: [
                  ListTile(
                    title: Text(pair.asLowerCase),
                    leading: const Icon(Icons.favorite, color: Colors.red),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, semanticLabel: 'Deletar'),
                      color: theme.colorScheme.primary,
                      onPressed: () => appState.removeFavorite(pair),
                    ),
                  ),
                  const Divider(),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
