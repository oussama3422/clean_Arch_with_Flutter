import 'package:clean_app_arch_tdd/core/error/failures.dart';
import 'package:clean_app_arch_tdd/core/usescases/usercase.dart';
import 'package:clean_app_arch_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../entities/number_trivia.dart';

class GetConcreteNumberTrivia implements UserCase<NumberTrivia,Params>{
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia({required this.repository});
  
  @override
  Future<Either<Failure, NumberTrivia>?> call({required Params params}) async{
    return await repository.getConcreteNumberTrivia(params.number);
  }

}

class Params extends Equatable{
  final int number;
  const Params({required this.number});
  
  @override
  List<Object?> get props =>[number];
}