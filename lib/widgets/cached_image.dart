import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/utils/app_constants.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  const CachedImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: 55,
      width: 55,
      imageUrl: imageUrl,
      // imageBuilder: (context, imageProvider) => Image.asset(name),
      // progressIndicatorBuilder: (context, url, downloadProgress) =>
      //     CircularProgressIndicator(value: downloadProgress.progress),
      placeholder: (context, url) =>
          Center(child: Image.asset(AppConstants.PLACEHOLDER_IMAGE)),
      errorWidget: (context, url, error) =>
          Center(child: Image.asset(AppConstants.PLACEHOLDER_IMAGE)),
    );
  }
}
