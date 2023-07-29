import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  const SquareTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFFDBEDED),
      ),
      child: Image.asset(
        "assets/images/google.png",
        height: 60,
      ),
    );
  }
}
