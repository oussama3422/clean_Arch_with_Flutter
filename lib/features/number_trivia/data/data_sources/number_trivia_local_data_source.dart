import 'package:clean_app_arch_tdd/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource{
  /// Gets the cached [  ] which was gotten the last time
  /// the user has an iternet connection
  /// 
  /// Throws [CacheException] if no cached data is present
  Future<NumberTriviaModel>? getLastNumberTrivia();


  Future<void>? cacheNumberTrivia(NumberTriviaModel? triviaToCache);
}