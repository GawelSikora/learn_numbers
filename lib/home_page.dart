import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_numbers/cubit/main_cubit.dart';
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
          body: SafeArea(
            child: Column(
              children: [
                Builder(builder: (context) {
                  if (state.isCorrect) {
                    return const Text('correct');
                  } else {
                    return const Text('start');
                  }
                }),
                Expanded(
                    child: SizedBox(
                  child: Giraffes(numberGiraffes: state.numberGiraffes),
                )),
                Expanded(
                    child: SizedBox(
                        child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          MyButton(
                              number: 7, numberGiraffes: state.numberGiraffes),
                          MyButton(
                              number: 8, numberGiraffes: state.numberGiraffes),
                          MyButton(
                              number: 9, numberGiraffes: state.numberGiraffes),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          MyButton(
                              number: 4, numberGiraffes: state.numberGiraffes),
                          MyButton(
                              number: 5, numberGiraffes: state.numberGiraffes),
                          MyButton(
                              number: 6, numberGiraffes: state.numberGiraffes),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          MyButton(
                              number: 1, numberGiraffes: state.numberGiraffes),
                          MyButton(
                              number: 2, numberGiraffes: state.numberGiraffes),
                          MyButton(
                              number: 3, numberGiraffes: state.numberGiraffes),
                        ],
                      ),
                    ),
                  ],
                ))),
              ],
            ),
          ),
        );
      },
    );
  }
}
