part of 'number_trivia_bloc.dart';

@immutable
abstract class NumberTriviaState {}

class NumberTriviaInitial extends NumberTriviaState {}

class LoadingState extends NumberTriviaState{}

class LoadedState extends NumberTriviaState{
  final NumberTriviaModel numberTriviaModel;
  LoadedState({required this.numberTriviaModel});

}
class ErrorState extends NumberTriviaState{}