import 'package:clean_app_arch_tdd/core/error/exceptions.dart';
import 'package:clean_app_arch_tdd/core/platform/network_info.dart';
import 'package:clean_app_arch_tdd/features/number_trivia/data/data_sources/number_trivia_local_data_source.dart';
import 'package:clean_app_arch_tdd/features/number_trivia/data/data_sources/number_trivia_remote_data_source.dart';
import 'package:clean_app_arch_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_app_arch_tdd/core/error/failures.dart';
import 'package:clean_app_arch_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';

class NumberTriviaRepositoryImplementation implements NumberTriviaRepository{
   final NumberTriviaRemoteDataSource remoteDataSource;
   final NumberTriviaLocalDataSource localDataSource;
   final NetworkInfo networkInfo;
   NumberTriviaRepositoryImplementation({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
   });


 Future<Either<Failure,NumberTrivia>> getTrivia(Function() getConcreteOrRandom )async{
  if(await networkInfo.isConnected!){
    try{
     final remoteTrivia=await getConcreteOrRandom();
     localDataSource.cacheNumberTrivia(remoteTrivia);
     return Right(remoteTrivia);
    }on ServerException{
      return Left(ServerFailure());
    }
    }else{
      try{
      final localTrivia=await localDataSource.getLastNumberTrivia();
        return Right(localTrivia!);
      }on CacheException{
         return Left(CacheFailure());
       }
    }

 }
 
  // @override
  // Future<Either<Failure, NumberTrivia>>? getConcreteNumberTrivia(number)  async{
  //   networkInfo!.isConnected!;
  //   return Right(await remoteDataSource!.getConcreteNumberTrivia(number)!);
  // }
  

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(number) async{
      networkInfo.isConnected!;
      return Right(await remoteDataSource.getConcreteNumberTrivia(number)!);
      // return null;
  }
  
  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    throw UnimplementedError();
  }
}