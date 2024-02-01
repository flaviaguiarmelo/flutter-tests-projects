import 'package:flutter/material.dart';
import 'package:flutter_codelab_secondapp/app_state.dart';
import 'package:provider/provider.dart';
import 'routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: Routes.navigationRail(
                selectedIndex,
                constraints,
                onDestinationSelected: (value) {
                  setState(() => selectedIndex = value);
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Routes.selectedPage(appState, selectedIndex),
              ),
            ),
          ],
        ),
      );
    });
  }
}
