import 'package:clean_app_arch_tdd/core/error/failures.dart';
import 'package:clean_app_arch_tdd/core/usescases/usercase.dart';
import 'package:clean_app_arch_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_app_arch_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRandomNumberTrivia implements UserCase<NumberTrivia,NoParams>{
  final NumberTriviaRepository repository;
  GetRandomNumberTrivia({required this.repository});
  @override
  Future<Either<Failure, NumberTrivia>?> call({required NoParams params}) async{
    return await repository.getRandomNumberTrivia();
  }


}
class NoParams extends Equatable{
  @override
  List<Object?> get props => throw UnimplementedError();

}


