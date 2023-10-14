class NumberTriviaModel {
  final String text;
  final int number;
  NumberTriviaModel({required this.number, required this.text});

  factory NumberTriviaModel.fromMap(Map<String, dynamic> map) =>
      NumberTriviaModel(number: map['number'], text: map['text']);
}