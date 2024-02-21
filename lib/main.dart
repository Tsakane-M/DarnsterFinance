import 'package:flutter/material.dart';
import 'app/dependencies.dart';
import 'pages/example/example_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Dependencies(
        child: ExamplePage(),
      ),
    );
  }
}
