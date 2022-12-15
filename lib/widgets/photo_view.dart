// ignore_for_file: unnecessary_question_mark

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:prepared_academy/themes/color_theme.dart';

class ViewPhoto extends StatelessWidget {
  const ViewPhoto({
    super.key,
    this.imageProvider,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
  });

  final ImageProvider? imageProvider;
  final BoxDecoration? backgroundDecoration;
  final dynamic? minScale;
  final dynamic? maxScale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(backgroundColor: kBlack, foregroundColor: kWhite),
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: PhotoView(
          imageProvider: imageProvider,
          backgroundDecoration: backgroundDecoration,
          minScale: minScale,
          maxScale: maxScale,
          heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
        ),
      ),
    );
  }
}
