import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prepared_academy/utils/app_constants.dart';

class SvgImage extends StatelessWidget {
  final String imageUrl;
  const SvgImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      imageUrl,
      height: 50,
      width: 50,
      fit: BoxFit.cover,
      placeholderBuilder: (BuildContext context) => Image.asset(
        AppConstants.PLACEHOLDER_IMAGE,
        height: 40,
        width: 40,
      ),
    );
  }
}
