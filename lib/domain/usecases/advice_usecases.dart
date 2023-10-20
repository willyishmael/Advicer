
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  Future<Either<Failure, AdviceEntity>> getAdvice() async{
    await Future.delayed(const Duration(seconds: 3), () {});
    // return right(AdviceEntity(advice: "halo dek", id: 1));
    return left(GeneralFailure());
  } 
}

