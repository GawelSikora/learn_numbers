import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_numbers/cubit/main_cubit.dart';
import 'package:learn_numbers/models/background.dart';
import 'package:learn_numbers/models/giraffes.dart';
import 'package:learn_numbers/models/my_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Stack(
              children: [
                const Background(),
                Column(
                  children: [
                    Expanded(
                        flex: 6,
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Builder(builder: (context) {
                              if (state.isCorrect) {
                                return const Center(child: Elephant());
                              } else {
                                return Giraffes(
                                    numberGiraffes: state.numberGiraffes, isGiraffe: state.isGiraffe,);
                              }
                            }),
                          ),
                        )),
                    Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    MyButton(
                                        number: 7,
                                        numberGiraffes: state.numberGiraffes),
                                    MyButton(
                                        number: 8,
                                        numberGiraffes: state.numberGiraffes),
                                    MyButton(
                                        number: 9,
                                        numberGiraffes: state.numberGiraffes),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    MyButton(
                                        number: 4,
                                        numberGiraffes: state.numberGiraffes),
                                    MyButton(
                                        number: 5,
                                        numberGiraffes: state.numberGiraffes),
                                    MyButton(
                                        number: 6,
                                        numberGiraffes: state.numberGiraffes),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    MyButton(
                                        number: 1,
                                        numberGiraffes: state.numberGiraffes),
                                    MyButton(
                                        number: 2,
                                        numberGiraffes: state.numberGiraffes),
                                    MyButton(
                                        number: 3,
                                        numberGiraffes: state.numberGiraffes),
                                  ],
                                ),
                              ),
                            ],
                          )),
                        )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
