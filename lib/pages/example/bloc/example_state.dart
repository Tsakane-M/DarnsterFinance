part of 'example_bloc.dart';

class ExampleState {
  ExampleState({required this.isLoading, required this.planets});

  ExampleState.initial()
      : isLoading = false,
        planets = <Planet>[];

  final bool isLoading;
  final List<Planet> planets;

  ExampleState copyWith({
    bool? isLoading,
    List<Planet>? planets,
  }) {
    return ExampleState(
      isLoading: isLoading ?? this.isLoading,
      planets: planets ?? this.planets,
    );
  }
}
