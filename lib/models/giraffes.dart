import 'package:flutter/material.dart';

class Giraffes extends StatefulWidget {
  const Giraffes({required this.numberGiraffes, super.key});
  final int numberGiraffes;

  @override
  State<Giraffes> createState() => _GiraffesState();
}

class _GiraffesState extends State<Giraffes> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.numberGiraffes,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100),
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: Expanded(
              child: Container(
                color: Colors.orange,
              ),
            ),
          );
        }));
  }
}
