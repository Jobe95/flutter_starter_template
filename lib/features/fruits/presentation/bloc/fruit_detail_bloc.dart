import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobe_template/features/fruits/domain/usecases/usecases.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/usecases/usecases.dart';
import '../../domain/entities/fruit.dart';

part 'fruit_detail_event.dart';
part 'fruit_detail_state.dart';

EventTransformer<Event> debounceTransformer<Event>(Duration duration) {
  return (events, mapper) {
    return events.debounceTime(duration).switchMap(mapper);
  };
}

class FruitDetailBloc extends Bloc<FruitDetailEvent, FruitDetailState> {
  final GetFruitByNameUseCase getFruitByNameUseCase;
  Fruit? initialFruit;

  FruitDetailBloc({required this.getFruitByNameUseCase}) : super(Empty()) {
    on<GetFruitByName>((event, emit) async {
      emit(Loading());
      Either<Failure, Fruit> data =
          await getFruitByNameUseCase(FruitByNameParam(event.name));
      final state = _eitherLoadedOrErrorState(data);
      if (state is Loaded) {
        initialFruit = state.fruit;
      }
      emit(state);
    });
    on<SearchFruitByName>((event, emit) async {
      emit(Loading());
      Either<Failure, Fruit> data =
          await getFruitByNameUseCase(FruitByNameParam(event.name));
      final state = _eitherInitialOrLoadedOrErrorState(data);
      if (state is Loaded) {
        initialFruit = state.fruit;
      }
      emit(state);
    }, transformer: debounceTransformer(const Duration(milliseconds: 750)));
  }

  FruitDetailState _eitherInitialOrLoadedOrErrorState(
          Either<Failure, Fruit> data) =>
      data.fold(
        (failure) {
          if (failure is ValidationFailure && initialFruit != null) {
            return Loaded(fruit: initialFruit!);
          }
          return Error(message: failure.message);
        },
        (fruit) => Loaded(fruit: fruit),
      );

  FruitDetailState _eitherLoadedOrErrorState(Either<Failure, Fruit> data) =>
      data.fold(
        (failure) => Error(message: failure.message),
        (fruit) => Loaded(fruit: fruit),
      );

  String getHintText() {
    if (initialFruit != null) {
      return initialFruit!.name;
    }
    return 'Sök efter frukt';
  }
}
