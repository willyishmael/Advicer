import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceCubitState> {
  AdviceCubit() : super(AdviceCubitInitialState());

  void adviceRequestEvent() {
    emit(AdviceCubitLoadingState());
  }
}
