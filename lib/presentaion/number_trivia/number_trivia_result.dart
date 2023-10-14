import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:number_trivia_api/presentaion/bloc/number_trivia_bloc.dart';

class NumberTriviaResult extends StatefulWidget {
  const NumberTriviaResult({super.key});


  @override
  State<NumberTriviaResult> createState() => _NumberTriviaResultState();
}

class _NumberTriviaResultState extends State<NumberTriviaResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: const Text(
            'Number Trivia Result'
        ),
      ),
      body: BlocConsumer<NumberTriviaBloc, NumberTriviaState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(state is ErrorState)
                    Icon(Icons.error,size: 50,),
                  if(state is NumberTriviaInitial)
                    const Column(
                      children: [
                        Text(
                          'Start Searching',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  if(state is LoadingState)
                    const CircularProgressIndicator(),
                  if(state is LoadedState)
                    Column(
                      children: [
                        Text(
                          '${state.numberTriviaModel.number}',
                          style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 16,),
                        Text(
                          state.numberTriviaModel.text,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
          ),
                      ],
                    ),
                ],
              ),
            ),
          );
        }, listener: (BuildContext context, NumberTriviaState state) {
          if(state is LoadedState){
            Fluttertoast.showToast(
                msg: "successfully",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.purple,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
      },
      ),
    );
  }
}