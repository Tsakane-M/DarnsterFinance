import 'package:flutter/material.dart';
import 'app/dependencies.dart';
import 'darnster_finance.dart';

void main() {
  runApp(const EntryPoint());
}

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return const Dependencies(
      child: DarnsterFinance(),
    );
  }
}
