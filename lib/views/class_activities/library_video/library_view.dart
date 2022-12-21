import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../models/activity_model.dart';
import '../../../utils/app_constants.dart';

class LibraryImagesView extends StatefulWidget {
  final Library library;
  final String title;
  const LibraryImagesView(
      {super.key, required this.library, required this.title});

  @override
  State<LibraryImagesView> createState() => _LibraryImagesViewState();
}

class _LibraryImagesViewState extends State<LibraryImagesView> {
  CarouselController buttonCarouselController = CarouselController();
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider.builder(
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: false,
                viewportFraction: 1,
                autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                autoPlayCurve: Curves.decelerate,
                onPageChanged: (index, reason) {
                  setState(() {
                    current = index;
                  });
                },
              ),
              itemCount: widget.library.images.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Image.network(
                "${AppConstants.BASE_URL}/${widget.library.images[itemIndex].image}",
              ),
            ),
            widget.library.images.length == 1
                ? const SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        IconButton(
                            color: Colors.white.withOpacity(0.5),
                            onPressed: () =>
                                buttonCarouselController.previousPage(),
                            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                        IconButton(
                            color: Colors.white.withOpacity(0.5),
                            onPressed: () =>
                                buttonCarouselController.nextPage(),
                            icon: const Icon(Icons.arrow_forward_ios_rounded))
                      ]),
          ],
        ));
  }
}
