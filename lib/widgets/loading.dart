import 'package:flutter/material.dart';
import 'package:prepared_academy/themes/color_theme.dart';

class Loading extends StatelessWidget {
  final double? value;
  const Loading({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 38,
        height: 38,
        child: CircularProgressIndicator(
            value: value,
            strokeWidth: 5.0,
            valueColor: const AlwaysStoppedAnimation<Color>(kPrimaryColor)),
      ),
    );
  }
}
