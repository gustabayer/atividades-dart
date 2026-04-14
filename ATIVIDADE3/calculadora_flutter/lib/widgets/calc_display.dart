import 'package:flutter/material.dart';

class CalcDisplay extends StatelessWidget {
  final String text;

  const CalcDisplay({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.all(20),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 48,
          color: Colors.white,
        ),
      ),
    );
  }
}