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
    final currentHeight = MediaQuery.of(context).size.height;
    final fontSize = currentHeight ~/ 10;

    final currentWidth = MediaQuery.of(context).size.width;
    final boxWidth = currentWidth ~/ 3.5;

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

    return GestureDetector(
      onTap: (() {
        if (widget.number == widget.numberGiraffes) {
          setState(() {
            state = 2;
          });
          AudioPlayer().play(AssetSource('music/correct.mp3'));
          context.read<MainCubit>().resultCorrect(widget.numberGiraffes);
          Timer(const Duration(milliseconds: 500), () {
            setState(() {
              state = 1;
            });
          });
        } else {
          AudioPlayer().play(AssetSource('music/error.mp3'));
          setState(() {
            state = 3;
          });
          Timer(const Duration(milliseconds: 500), () {
            setState(() {
              state = 1;
            });
          });
        }
      }),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: AnimatedContainer(
            width: boxWidth.toDouble(),
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(color: containerColor, boxShadow: const [
              BoxShadow(
                  color: Colors.black,
                  blurStyle: BlurStyle.solid,
                  blurRadius: 5,
                  spreadRadius: 2,
                  offset: Offset(3, 3)),
            ]),
            child: Center(
                child: Text(
              widget.number.toString(),
              style: TextStyle(fontSize: fontSize.toDouble()),
            )),
          ),
        ),
      ),
    );
  }
}
