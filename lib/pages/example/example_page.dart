import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/example_bloc.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExampleBloc>(
      create: (BuildContext context) {
        return ExampleBloc(exampleRepo: context.read())
          ..add(ExampleDidLoadEvent());
      },
      child: BlocBuilder<ExampleBloc, ExampleState>(
        builder: (
          BuildContext context,
          ExampleState state,
        ) {
          if (state.isLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            body: SafeArea(
              child: ListView.builder(
                itemCount: state.planets.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(state.planets[index].name),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
