import 'package:flutter/material.dart';
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
    var colorScheme = Theme.of(context).colorScheme;

    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Routes.selectedPage(selectedIndex),
      ),
    );

    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return Column(
          children: [
            Expanded(child: mainArea),
            SafeArea(
              child: Routes.navigationBottomBar(
                selectedIndex,
                onItemSelected: (value) => setState(() => selectedIndex = value),
              ),
            )
          ],
        );
      } else {
        return Row(
          children: [
            SafeArea(
              child: Routes.navigationSideBar(
                selectedIndex,
                constraints.maxWidth,
                onItemSelected: (value) => setState(() => selectedIndex = value),
              ),
            ),
            Expanded(child: mainArea),
          ],
        );
      }
    }));
  }
}
