import 'package:advicer/data/repositories/advice_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceCubitState> {
  final AdvicerRepositoryProtocol advicerRepository;
  AdviceCubit({required this.advicerRepository})
      : super(AdviceCubitInitialState());

  void adviceRequestEvent() async {
    emit(AdviceCubitLoadingState());
    final result = await advicerRepository.getRandomAdvice();
    result.fold(
      (failure) => emit(AdviceCubitErrorState(message: failure.message)),
      (advice) => emit(AdviceCubitLoadedState(advice: advice.advice)),
    );
  }
}
