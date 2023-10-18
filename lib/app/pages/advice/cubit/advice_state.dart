part of 'advice_cubit.dart';

@immutable
abstract class AdviceCubitState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdviceCubitInitialState extends AdviceCubitState {}

class AdviceCubitLoadingState extends AdviceCubitState {}

class AdviceCubitLoadedState extends AdviceCubitState {
  final String advice;
  AdviceCubitLoadedState({required this.advice});

  @override
  List<Object?> get props => [advice];
}

class AdviceCubitErrorState extends AdviceCubitState {
  final String message;
  AdviceCubitErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}