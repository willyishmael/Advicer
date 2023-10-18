part of 'advice_bloc.dart';

@immutable
abstract class AdviceState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdviceInitialState extends AdviceState {}

class AdviceLoadingState extends AdviceState {}

class AdviceLoadedState extends AdviceState {
  final String advice;
  AdviceLoadedState({required this.advice});

  @override
  List<Object?> get props => [advice];
}

class AdviceErrorState extends AdviceState {
  final String message;
  AdviceErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
