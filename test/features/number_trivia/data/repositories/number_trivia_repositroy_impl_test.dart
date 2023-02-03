
import 'package:clean_app_arch_tdd/core/platform/network_info.dart';
import 'package:clean_app_arch_tdd/features/number_trivia/data/data_sources/number_trivia_local_data_source.dart';
import 'package:clean_app_arch_tdd/features/number_trivia/data/data_sources/number_trivia_remote_data_source.dart';
import 'package:clean_app_arch_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_app_arch_tdd/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:clean_app_arch_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';


class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource{}
class MockRemoteDataSource extends Mock implements NumberTriviaRemoteDataSource{}
class MockNetworkInfo extends Mock implements NetworkInfo{}

void main(){
  late NumberTriviaRepositoryImplementation repositoryImplementation;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  setUp((){
    mockRemoteDataSource=MockRemoteDataSource();
    mockLocalDataSource=MockLocalDataSource();
    mockNetworkInfo=MockNetworkInfo();
    repositoryImplementation=NumberTriviaRepositoryImplementation(
      remoteDataSource:mockRemoteDataSource,
      localDataSource:mockLocalDataSource,
      networkInfo:mockNetworkInfo,
    );
  });
   group('getConcreteNumerTrivia', (){
    int tNumber=1;
    NumberTriviaModel tNumberTriviaModel=const NumberTriviaModel(number: 1,text:'test trivia');
    final NumberTrivia tNumberTrivia=tNumberTriviaModel;

   test(
    'should check if the device is online',
    ()async{
      //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async=> true);
      //act
        await repositoryImplementation.getConcreteNumberTrivia(tNumber);
      //assert
        verify(mockNetworkInfo.isConnected);
    });
    // group online functionality
    group('device is online', (){
     setUp((){
        when(mockNetworkInfo.isConnected).thenAnswer((_) async=> true);
     });

     test(
      'should return remote data when the call to remote data source is successfull',
      ()async{
        //arrange
          when(mockRemoteDataSource.getConcreteNumberTrivia(any)).thenAnswer((_) async=> tNumberTriviaModel);
         //act
          final res=await repositoryImplementation.getConcreteNumberTrivia(tNumber);
         //assert
         verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
         expect(res, equals(Right(tNumberTrivia)));
      });
    });
    //
    // group online functionality
    group('device is offline', (){
     setUp((){
        when(mockNetworkInfo.isConnected).thenAnswer((_) async=> false);
     });
    });
    //


   });

}