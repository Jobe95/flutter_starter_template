part of 'fruits_bloc.dart';

@immutable
abstract class FruitsState extends Equatable {
  const FruitsState();

  @override
  List<Object> get props => [];
}

class Loading extends FruitsState {}

class Empty extends FruitsState {}

class Loaded extends FruitsState {
  final List<Fruit> fruits;

  const Loaded({required this.fruits});

  @override
  List<Object> get props => [fruits];
}

class Error extends FruitsState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
