part of 'fruits_bloc.dart';

@immutable
abstract class FruitsEvent extends Equatable {
  const FruitsEvent();

  @override
  List<Object> get props => [];
}

class GetAllFruits extends FruitsEvent {}
