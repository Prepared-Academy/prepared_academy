import 'package:flutter/material.dart';
import 'package:prepared_academy/themes/color_theme.dart';

class CustomIconButton extends StatelessWidget {
  final IconData? iconData;
  final String? iconImage;
  final void Function()? onTap;
  final Color iconColor;
  const CustomIconButton(
      {super.key,
      this.iconData,
      this.onTap,
      this.iconColor = kBlack,
      this.iconImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: iconData == null
            ? Image.asset(
                iconImage!,
                height: 22,
                width: 22,
              )
            : Icon(
                iconData,
                color: iconColor,
              ),
      ),
    );
  }
}
