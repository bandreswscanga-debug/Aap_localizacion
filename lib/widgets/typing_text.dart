import 'package:flutter/material.dart';

class TypingText extends StatelessWidget {
  final String text;

  const TypingText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
