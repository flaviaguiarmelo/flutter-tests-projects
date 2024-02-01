import 'package:flutter/material.dart';
import 'package:flutter_codelab_secondapp/app_state.dart';
import 'package:flutter_codelab_secondapp/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const FlutterCodeLabApp());
}

class FlutterCodeLabApp extends StatelessWidget {
  const FlutterCodeLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Segundo codelab',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: const HomePage(),
      ),
    );
  }
}
