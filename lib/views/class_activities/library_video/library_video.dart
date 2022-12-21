import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/models/activity_model.dart';
import 'package:prepared_academy/utils/validator.dart';
import 'package:prepared_academy/views/class_activities/library_video/library_view.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import '../../../themes/color_theme.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/helper.dart';
import 'libray_video_webview.dart';

class LibraryVideo extends StatelessWidget {
  final ActivityModel activityModel;
  const LibraryVideo({super.key, required this.activityModel});

  Widget libraryVidos(List<Library> libraryList) => SizedBox(
        height: 200,
        child: ListView.builder(
            itemExtent: 150,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: libraryList.length,
            itemBuilder: (context, index) {
              final library = libraryList[index];
              return Card(
                margin: const EdgeInsets.only(right: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(color: gPink, width: 1.5)),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: library.librarytype == "image"
                          ? CarouselSlider.builder(
                              options: CarouselOptions(
                                height: 80,
                                autoPlay: true,
                                enlargeCenterPage: false,
                                viewportFraction: 1,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 1500),
                              ),
                              itemCount: library.images.length,
                              itemBuilder: (BuildContext context, int itemIndex,
                                      int pageViewIndex) =>
                                  Image.network(
                                "${AppConstants.BASE_URL}/${library.images[itemIndex].image}",
                                fit: BoxFit.fitHeight,
                              ),
                            )
                          : Container(
                              height: 80,
                              width: double.infinity,
                              color: Colors.red,
                              child: Image.network(
                                "${AppConstants.BASE_URL}/${library.videoThumbnail}",
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              library.subtitle,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              library.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 14),
                            ),
                            const Spacer(),
                            MiniElevatedButton(
                              backgroundColor: gPink,
                              fullWidth: true,
                              onPressed: () {
                                if (library.librarytype == "image") {
                                  OneContext().push(
                                    MaterialPageRoute(
                                        builder: (context) => LibraryImagesView(
                                              library: library,
                                              title: library.subtitle,
                                            )),
                                  );
                                } else {
                                  // Play video

                                  if (library.librarytype == "video") {
                                    OneContext().push(
                                      MaterialPageRoute(
                                        builder: (_) => LibraryVideoWebView(
                                          moduele: library.subtitle,
                                          description: library.description,
                                          videoUrl: library.link,
                                          isChapterVideo: false,
                                        ),
                                      ),
                                    );
                                  } else {}
                                }
                              },
                              text: library.librarytype == "image"
                                  ? "View"
                                  : "Play",
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 370,
          child: Card(
            color: Colors.white,
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: kBorder)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.all(0),
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/inclass/library.png"),
                    ),
                    title: Text(
                      "Day ${activityModel.sequence}",
                      style: const TextStyle(
                        color: gPink,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        const Text(
                          "Library Activity",
                        ),
                        Text(
                          "Unlock Date: ${DateFormat.yMMMMd('en_US').format(activityModel.activityDate!)}",
                        ),
                      ],
                    ),
                  ),
                  const Text("Chapter"),
                  Text(
                    activityModel.chapterName!.capitalize(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  libraryVidos(activityModel.libraries!),
                ],
              ),
            ),
          ),
        ),
        activityDateCheck(activityModel.activityDate!, true) == "lock"
            ? Center(
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: Container(
                      height: 370,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200.withOpacity(0.5)),
                      child: Center(
                          child: Image.asset(
                        AppConstants.ACTIVITYLOCK_ICON,
                        height: 60,
                      )),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
