import 'package:flutter/material.dart';
import 'package:number_trivia_api/data_source/models/number_trivia_model.dart';
import 'package:number_trivia_api/presentaion/number_trivia/number_trivia_result.dart';
import '../bloc/number_trivia_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberTrivia extends StatefulWidget {
  const NumberTrivia({super.key});

  @override
  State<NumberTrivia> createState() => _NumberTriviaState();
}

class _NumberTriviaState extends State<NumberTrivia> {
  TextEditingController numC = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool loading = false; //state
  NumberTriviaModel? numberTriviaModel; //state
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          title: const Text('Number Trivia'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(children: [
                  const Text('Start searching'),
                  const SizedBox(
                    height: 124,
                  ),
                  TextFormField(
                    controller: numC,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter A Number',
                      labelStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'number must be entered';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<NumberTriviaBloc>().add(
                                GetNumberTrivia(number: int.parse(numC.text)));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NumberTriviaResult()));
                          },
                          child: const Text('Search'),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8), // Adjust the border radius as needed
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          context
                              .read<NumberTriviaBloc>()
                              .add(GetRandomNumberTrivia());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NumberTriviaResult()));
                        },
                        child: const Text('Random'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Adjust the border radius as needed
                          ),
                        ),
                      )),
                    ],
                  )
                ]),
              ),
            ),
          ),
        ));
  }
}