import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_numbers/cubit/main_cubit.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    required this.number,
    required this.numberGiraffes,
    super.key,
  });
  final int number;
  final int numberGiraffes;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  var containerColor = Colors.blue;
  var state = 1;
  @override
  Widget build(BuildContext context) {
    switch (state) {
      case 2:
        setState(() {
          containerColor = Colors.green;
        });

        break;

      case 3:
        setState(() {
          containerColor = Colors.red;
        });

        break;

      case 1:
        setState(() {
          containerColor = Colors.blue;
        });
    }

    return Expanded(
        child: GestureDetector(
      onTap: (() {
        if (widget.number == widget.numberGiraffes) {
          setState(() {
            state = 2;
          });
          context.read<MainCubit>().resultCorrect();
          Timer(const Duration(milliseconds: 300), () {
            setState(() {
              state = 1;
            });
          });
        } else {
          AudioCache();
          setState(() {
            state = 3;
          });
          Timer(const Duration(milliseconds: 300), () {
            setState(() {
              state = 1;
            });
          });
        }
      }),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          color: containerColor,
          child: Center(
              child: Expanded(
                  child: Text(
            widget.number.toString(),
            style: const TextStyle(fontSize: 60),
          ))),
        ),
      ),
    ));
  }
}
