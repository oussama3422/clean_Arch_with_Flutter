import 'package:clean_app_arch_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_app_arch_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_app_arch_tdd/features/number_trivia/domain/usercases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepositroy extends Mock implements NumberTriviaRepository{

}
void main(){
  late GetRandomNumberTrivia usecase;
  late MockNumberTriviaRepositroy mockNumberTriviaRepositroy;

  setUp((){
    mockNumberTriviaRepositroy=MockNumberTriviaRepositroy();
    usecase=GetRandomNumberTrivia(repository: mockNumberTriviaRepositroy);
  });
  
  // ignore: prefer_const_constructors
  final tNumberTrivia=NumberTrivia(number: 1,text: 'test');
  test(
    'should get trivia for the number drom the repository',
    ()async{
      //arange 
        when(mockNumberTriviaRepositroy.getRandomNumberTrivia()).thenAnswer(
          (_) async => Right(tNumberTrivia),
      );
      //act 
        // usecase=GetConcreteNumberTrivia(repository: mockNumberTriviaRepositroy!);
        final result=await usecase(params: NoParams());
      //assert
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepositroy.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepositroy);
    });

  }

