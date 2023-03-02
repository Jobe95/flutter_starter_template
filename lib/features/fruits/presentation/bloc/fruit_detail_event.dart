part of 'fruit_detail_bloc.dart';

abstract class FruitDetailEvent extends Equatable {
  const FruitDetailEvent();

  @override
  List<Object> get props => [];
}

class GetFruitByName extends FruitDetailEvent {
  const GetFruitByName(this.name);
  final String name;

  @override
  List<Object> get props => [name];
}

class SearchFruitByName extends FruitDetailEvent {
  const SearchFruitByName(this.name);
  final String name;

  @override
  List<Object> get props => [name];
}
