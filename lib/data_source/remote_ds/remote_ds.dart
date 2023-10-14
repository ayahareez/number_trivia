import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

import 'package:number_trivia_api/data_source/models/number_trivia_model.dart';

abstract class TriviaRemoteDs{
  /// this function take int variable and return a string that contains the text
  /// that represent the trivia number
  Future<NumberTriviaModel> getNumberTrivia(int num);

  /// this function take random int number and return a string that contains the text
  /// that represent the trivia number
  Future<NumberTriviaModel> getRandomNumberTrivia();
}


class TriviaRemoteDsImpl extends TriviaRemoteDs{
 
  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async {
     var url=Uri.parse('http://numbersapi.com/random');
     var response=await get(url,headers: {HttpHeaders.contentTypeHeader:'application/json'} );
     if(response.statusCode>=200 && response.statusCode<=299){
       print(response.statusCode);
       print(response.body);
       Map<String,dynamic> jsonMap=jsonDecode(response.body);
       NumberTriviaModel numberTriviaModel=NumberTriviaModel.fromMap(jsonMap);
       return numberTriviaModel;
     }
     else{
       throw Exception('Api call failed');
     }


  }

  @override
  Future<NumberTriviaModel> getNumberTrivia(int num) async {
    var url=Uri.parse('http://numbersapi.com/$num');
    var response= await get(url,headers: {HttpHeaders.contentTypeHeader:'application/json'});
    if(response.statusCode>=200 && response.statusCode<=299){
      Map<String,dynamic> jsonMap=jsonDecode(response.body);
      NumberTriviaModel numberTriviaModel=NumberTriviaModel.fromMap(jsonMap);
      return numberTriviaModel;
    }
    else{
      throw Exception('Api call failed');
    }

  }

}