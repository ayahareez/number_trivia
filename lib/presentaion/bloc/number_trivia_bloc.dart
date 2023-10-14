import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:number_trivia_api/data_source/models/number_trivia_model.dart';
import 'package:number_trivia_api/data_source/remote_ds/remote_ds.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  NumberTriviaBloc() : super(NumberTriviaInitial()) {
    on<NumberTriviaEvent>((event, emit) async {
     try{
       if(event is GetRandomNumberTrivia){
         emit(LoadingState());//give it instance of the states
         NumberTriviaModel numberTriviaModel=await TriviaRemoteDsImpl().getRandomNumberTrivia();
         emit(LoadedState(numberTriviaModel: numberTriviaModel));
       }
       else if(event is GetNumberTrivia){
         emit(LoadingState());//give it instance of the states
         NumberTriviaModel numberTriviaModel=await TriviaRemoteDsImpl().getNumberTrivia(event.number);
         emit(LoadedState(numberTriviaModel: numberTriviaModel));
       }
     }catch(e){
       emit(ErrorState());
     }
      
    });
  }
}