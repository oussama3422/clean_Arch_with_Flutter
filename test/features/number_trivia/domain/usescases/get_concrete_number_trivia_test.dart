import 'package:clean_app_arch_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_app_arch_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_app_arch_tdd/features/number_trivia/domain/usercases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepositroy extends Mock implements NumberTriviaRepository{

}
@GenerateMocks([NumberTriviaRepository])
void main(){
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepositroy mockNumberTriviaRepositroy;

  setUp((){
    mockNumberTriviaRepositroy=MockNumberTriviaRepositroy();
    usecase=GetConcreteNumberTrivia(repository: mockNumberTriviaRepositroy);
  });
  int tNumber=1;
  NumberTrivia tNumberTrivia= const NumberTrivia(number: 1,text: 'test');
  test(
    'should get trivia for the number drom the repository',
    ()async{
      //arange 
        when(mockNumberTriviaRepositroy.getConcreteNumberTrivia(any)).thenAnswer(
          (_) async => Right(tNumberTrivia),
      );
      //act 
        // usecase=GetConcreteNumberTrivia(repository: mockNumberTriviaRepositroy);
        final result=await usecase(params:Params(number:tNumber));
      //assert
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepositroy.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepositroy);
    }
  
  
  );

  }

