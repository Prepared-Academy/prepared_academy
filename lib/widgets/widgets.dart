import 'package:flutter/material.dart';
import 'package:prepared_academy/themes/color_theme.dart';

class ChaptersDataCount extends StatelessWidget {
  final String text;
  final String count;
  const ChaptersDataCount({super.key, required this.text, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.09),
          borderRadius: BorderRadius.circular(4)),
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Center(
        child: Text(
          "$count $text",
          style: const TextStyle(color: kPrimaryColor, fontSize: 12),
        ),
      ),
    );
  }
}
