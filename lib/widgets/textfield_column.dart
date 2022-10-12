import 'package:flutter/material.dart';

class TextFieldColumn extends StatelessWidget {
  final String text;
  final Widget widget;
  const TextFieldColumn({super.key, required this.text, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 3),
        widget,
      ],
    );
  }
}
