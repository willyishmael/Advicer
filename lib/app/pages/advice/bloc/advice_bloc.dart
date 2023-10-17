import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceInitialState()) {
    on<AdviceRequestEvent>((event, emit) {
      emit(AdviceLoadingState());
    });
  }
}
