import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobe_template/features/fruits/domain/usecases/usecases.dart';

import '../../../../core/usecases/usecases.dart';
import '../../domain/entities/fruit.dart';

part 'fruit_detail_event.dart';
part 'fruit_detail_state.dart';

class FruitDetailBloc extends Bloc<FruitDetailEvent, FruitDetailState> {
  final GetFruitByNameUseCase getFruitByNameUseCase;
  FruitDetailBloc({required this.getFruitByNameUseCase}) : super(Empty()) {
    on<GetFruitByName>((event, emit) async {
      emit(Loading());
      Either<Failure, Fruit> data =
          await getFruitByNameUseCase(FruitByNameParam(event.name));

      return emit(_eitherLoadedOrErrorState(data));
    });
  }

  FruitDetailState _eitherLoadedOrErrorState(Either<Failure, Fruit> data) =>
      data.fold(
        (failure) => Error(message: failure.message),
        (fruit) => Loaded(fruit: fruit),
      );
}
