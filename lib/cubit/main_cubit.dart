import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState(false, 4, true));

  var numberGiraffe = 4;

  void start() {
    emit(MainState(false, Random().nextInt(9) + 1, Random().nextBool()));
  }

  void resultCorrect(number) {
    emit(MainState(true, number, false));

    Timer(const Duration(milliseconds: 2600), () {
      emit(MainState(false, Random().nextInt(9) + 1, Random().nextBool()));
    });
  }
}
