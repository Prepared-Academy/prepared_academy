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
      height: 27,
      width: fullWidth == null ? null : MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
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

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color foregroundColor;
  final Color backgroundColor;
  final bool? fullWidth;
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.foregroundColor = kWhite,
      this.backgroundColor = kPrimaryColor,
      this.fullWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: fullWidth == null ? null : MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
        child: Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color foregroundColor;
  final Color backgroundColor;
  final bool? fullWidth;
  const CustomOutlinedButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.foregroundColor = kBlack,
      this.backgroundColor = kPrimaryColor,
      this.fullWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: fullWidth == null ? null : MediaQuery.of(context).size.width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: foregroundColor,
          // backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
        child: Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color foregroundColor;
  final Color backgroundColor;
  final bool? fullWidth;
  const CustomTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.foregroundColor = kBlack,
      this.backgroundColor = kPrimaryColor,
      this.fullWidth});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor,
        // backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}

class Buttonicon extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color foregroundColor;
  final Color backgroundColor;
  final bool? fullWidth;
  const Buttonicon(
      {super.key,
      required this.onPressed,
      required this.text,
      this.foregroundColor = kWhite,
      this.backgroundColor = kPrimaryColor,
      this.fullWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 27,
      width: fullWidth == null ? null : MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(text),
              const SizedBox(width: 5),
              const Icon(Icons.double_arrow, size: 15.0),
            ],
          )),
    );
  }
}
