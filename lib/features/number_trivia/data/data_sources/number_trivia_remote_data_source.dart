import 'package:clean_app_arch_tdd/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource{
  /// Calls the http://numberapi.com/{number} endpoint
  /// 
  /// Throws a [ServerException] for all error codes
  Future<NumberTriviaModel>? getConcreteNumberTrivia(number);
  /// Calls the http://numberapi.com/random endpoint
  /// 
  /// Throws a [ServerException] for all error codes
  Future<NumberTriviaModel>?  getRandomNumberTrivia();
}