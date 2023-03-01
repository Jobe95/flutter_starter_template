part of 'startup_bloc.dart';

abstract class StartupState extends Equatable {
  const StartupState();  

  @override
  List<Object> get props => [];
}
class StartupInitial extends StartupState {}
