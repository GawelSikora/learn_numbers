import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _Background();
}

class _Background extends State<Background> {
  @override
  Widget build(BuildContext context) {
    final currenWidth = MediaQuery.of(context).size.width;

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Image.asset(
          'assets/grass.jpg',
          width: currenWidth,
        ),
        Image.asset(
          'assets/grass.jpg',
          width: currenWidth,
        )
      ],
    );
  }
}
