import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_numbers/core/enums.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState(false, 4, Animal.giraffe));

  var numberGiraffe = 4;
  var random =  Random();

  void start() {
    emit(MainState(false, Random().nextInt(9) + 1, animals[random.nextInt(animals.length)]));
  }

  void resultCorrect(number) {
    emit(MainState(
      true,
      number, Animal.hippo
    ));

    Timer(const Duration(milliseconds: 2600), () {
      emit(MainState(false, Random().nextInt(9) + 1, animals[random.nextInt(animals.length)]));
    });
  }
}
