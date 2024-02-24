import 'package:flutter/material.dart';
import 'app/dependencies.dart';

void main() {
  runApp(const DarnsterApp());
}

class DarnsterApp extends StatelessWidget {
  const DarnsterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Dependencies(
      child: Container(color: ThemeData.dark().scaffoldBackgroundColor),
    );
  }
}
