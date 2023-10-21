import 'package:advicer/data/exceptions/exceptions.dart';
import 'package:advicer/data/remote/advicer_api.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdvicerRepository {
  final advicerApi = AdvicerAPI();

  Future<Either<Failure, AdviceEntity>> getRandomAdvice() async{
    try {
      final result = await advicerApi.getRandomAdvice();
      return right(result);
    } on ServerException {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
  
}