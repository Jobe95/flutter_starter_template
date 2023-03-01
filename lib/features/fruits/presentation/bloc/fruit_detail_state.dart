part of 'fruit_detail_bloc.dart';

abstract class FruitDetailState extends Equatable {
  const FruitDetailState();

  @override
  List<Object> get props => [];
}

class Loading extends FruitDetailState {}

class Empty extends FruitDetailState {}

class Loaded extends FruitDetailState {
  final Fruit fruit;

  const Loaded({required this.fruit});

  @override
  List<Object> get props => [fruit];
}

class Error extends FruitDetailState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
