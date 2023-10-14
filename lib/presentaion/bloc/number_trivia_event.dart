part of 'number_trivia_bloc.dart';
//functions to be done think what the function you need to do then make event to each function
@immutable
abstract class NumberTriviaEvent {}

class GetNumberTrivia extends NumberTriviaEvent{
  final int number;
  GetNumberTrivia({required this.number});

}

class GetRandomNumberTrivia extends NumberTriviaEvent{}