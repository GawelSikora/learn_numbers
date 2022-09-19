import 'package:flutter/material.dart';

class Giraffes extends StatefulWidget {
  const Giraffes(
      {required this.numberGiraffes, required this.isGiraffe, super.key});
  final int numberGiraffes;
  final bool isGiraffe;

  @override
  State<Giraffes> createState() => _GiraffesState();
}

class _GiraffesState extends State<Giraffes> {
  @override
  Widget build(BuildContext context) {
    var isGiraffe = true;
    isGiraffe = widget.isGiraffe;
    return Expanded(
      child: GridView.builder(
          itemCount: widget.numberGiraffes,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(1.0),
              child: Expanded(
                  child: Image.asset(
                      isGiraffe ? 'assets/giraffe5.png' : 'assets/hippo.png')),
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
    return Expanded(child: Image.asset('assets/elephant.png'));
  }
}
