import 'package:clean_app_arch_tdd/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UserCase<Type,Params>{
  Future<Either<Failure, Type>?> call({required Params params});
}