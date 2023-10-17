part of 'advice_bloc.dart';

@immutable
abstract class AdviceState {}

class AdviceInitialState extends AdviceState {}

class AdviceLoadingState extends AdviceState {}

class AdviceLoadedState extends AdviceState {
  final String advice;
  AdviceLoadedState({required this.advice});
}

class AdviceErrorState extends AdviceState {
  final String message;
  AdviceErrorState({required this.message});
}
