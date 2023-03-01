import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobe_template/core/usecases/usecases.dart';
import 'package:jobe_template/features/fruits/domain/entities/entities.dart';
import 'package:jobe_template/features/fruits/domain/usecases/usecases.dart';

part 'fruits_event.dart';
part 'fruits_state.dart';

class FruitsBloc extends Bloc<FruitsEvent, FruitsState> {
  final GetAllFruitsUseCase getAllFruitsUseCase;
  FruitsBloc({required this.getAllFruitsUseCase}) : super(Empty()) {
    on<GetAllFruits>((event, emit) async {
      emit(Loading());
      Either<Failure, List<Fruit>> data = await getAllFruitsUseCase(NoParams());

      return emit(_eitherLoadedOrErrorState(data));
    });
  }

  FruitsState _eitherLoadedOrErrorState(Either<Failure, List<Fruit>> data) =>
      data.fold(
        (failure) => Error(message: failure.message),
        (fruits) => fruits.isEmpty ? Empty() : Loaded(fruits: fruits),
      );
}
