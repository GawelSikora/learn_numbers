import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_numbers/core/enums.dart';
import 'package:learn_numbers/cubit/main_cubit.dart';

class Giraffes extends StatefulWidget {
  const Giraffes(
      {required this.numberGiraffes, required this.animal, super.key});
  final int numberGiraffes;
  final Animal animal;

  @override
  State<Giraffes> createState() => _GiraffesState();
}

class _GiraffesState extends State<Giraffes> {
  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final fontSize = currentHeight ~/ 5;

    var animal = Animal.flamingo;
    animal = widget.animal;
    var imageAsset = '';

    switch (animal) {
      case Animal.giraffe:
        setState(() {
          imageAsset = 'assets/giraffe5.png';
        });

        break;
      case Animal.hippo:
        setState(() {
          imageAsset = 'assets/hippo.png';
        });

        break;
      case Animal.flamingo:
        setState(() {
          imageAsset = 'assets/flamingo.png';
        });

        break;
      case Animal.zebra:
        setState(() {
          imageAsset = 'assets/zebra.png';
        });

        break;
    }

    return Expanded(
      child: GridView.builder(
          itemCount: widget.numberGiraffes,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: fontSize.toDouble(),
          ),
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(1.0),
              child: Expanded(child: Image.asset(imageAsset)),
            );
          })),
    );
  }
}

class Elephant extends StatefulWidget {
  const Elephant({super.key});

  @override
  State<Elephant> createState() => _ElephantState();
}

class _ElephantState extends State<Elephant> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final fontSize = currentWidth ~/ 2;
    return Row(
      children: [
        BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return Text(
              state.numberGiraffes.toString(),
              style: TextStyle(
                fontSize: fontSize.toDouble(),
                color: Colors.amber,
                shadows: const <Shadow>[
                  Shadow(
                    offset: Offset(4.0, 4.0),
                    blurRadius: 5.0,
                    color: Colors.red,
                  ),
                  Shadow(
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 5.0,
                    color: Colors.white12,
                  ),
                ],
              ),
            );
          },
        ),
        Image.asset(
          'assets/elephant.png',
          width: fontSize.toDouble(),
        ),
      ],
    );
  }
}
