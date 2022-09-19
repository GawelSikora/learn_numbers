import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState(false, 4));

  var numberGiraffe = 4;

  void start() {
    emit(MainState(false, Random().nextInt(9) + 1));
  }

  void resultCorrect() {
    emit(MainState(true, 0));

    Timer(const Duration(milliseconds: 300), () {
      emit(MainState(false, Random().nextInt(9) + 1));
    });
  }
}
