import 'package:advicer/domain/usecases/advice_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceCubitState> {
  AdviceCubit() : super(AdviceCubitInitialState());
  final AdviceUseCases adviceUseCases = AdviceUseCases();

  void adviceRequestEvent() async {
    emit(AdviceCubitLoadingState());
    final response = await adviceUseCases.getAdvice();
    response.fold(
      (failure) => emit(AdviceCubitErrorState(message: failure.message)),
      (advice) => emit(AdviceCubitLoadedState(advice: advice.advice)),
    );
  }
}
