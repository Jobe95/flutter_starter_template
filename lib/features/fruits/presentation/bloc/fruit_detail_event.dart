part of 'fruit_detail_bloc.dart';

abstract class FruitDetailEvent extends Equatable {
  const FruitDetailEvent();

  @override
  List<Object> get props => [];
}

class GetFruitByName extends FruitDetailEvent {
  final String name;

  const GetFruitByName(this.name);

  @override
  List<Object> get props => [name];
}
