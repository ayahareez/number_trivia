class NumberTriviaEntity {
  final String text;
  final int number;

  NumberTriviaEntity({required this.text, required this.number});
}

class NumberTriviaModel extends NumberTriviaEntity {
  NumberTriviaModel({required super.text, required super.number});

  factory NumberTriviaModel.fromMap(Map<String, dynamic> map) =>
      NumberTriviaModel(number: map['number'], text: map['text']);
}