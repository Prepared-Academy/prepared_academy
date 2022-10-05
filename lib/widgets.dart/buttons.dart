import 'package:flutter/material.dart';
import 'package:prepared_academy/themes/color_theme.dart';

class MiniElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color foregroundColor;
  final Color backgroundColor;
  final bool? fullWidth;
  const MiniElevatedButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.foregroundColor = kWhite,
      this.backgroundColor = kPrimaryColor,
      this.fullWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: fullWidth == null ? null : MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
        child: Text(
          text,
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
