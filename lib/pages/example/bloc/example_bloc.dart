import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/example_repository.dart';
import '../../../domain/models/planet.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc({
    required this.exampleRepo,
  }) : super(ExampleState.initial()) {
    on<ExampleDidLoadEvent>(_handleDidLoad);
  }

  final ExampleRepository exampleRepo;

  Future<void> _handleDidLoad(
    ExampleDidLoadEvent event,
    Emitter<ExampleState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final List<Planet> planets = await exampleRepo.getPlanets();
    emit(state.copyWith(isLoading: false, planets: planets));
  }
}
