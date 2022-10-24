import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/models/activity_model.dart';
import 'package:prepared_academy/utils/validator.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import '../../../themes/color_theme.dart';
import '../../../utils/app_constants.dart';
import '../../../widgets/photo_view.dart';
import '../../../widgets/svg_image.dart';

class LibraryVideo extends StatelessWidget {
  final ActivityModel activityModel;
  const LibraryVideo({super.key, required this.activityModel});

  Widget libraryVidos(List<Library> libraryList) => SizedBox(
        height: 220,
        child: ListView.builder(
            itemExtent: 200,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: libraryList.length,
            itemBuilder: (context, index) {
              final library = libraryList[index];
              return Card(
                color: Colors.white,
                // elevation: 0,
                margin: const EdgeInsets.only(right: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: gGreen, width: 1.5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Container(
                        color: Colors.white,
                        height: 100,
                        width: double.maxFinite,
                        child: library.librarytype == "image"
                            ? Image.network(
                                "${AppConstants.BASE_URL}/${library.link}",
                                fit: BoxFit.cover,
                              )
                            : Image.asset(AppConstants.DEMOPOST_IMAGE,
                                fit: BoxFit.cover),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              library.subtitle!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              library.description!,
                              style: const TextStyle(fontSize: 14),
                            ),
                            const Spacer(),
                            MiniElevatedButton(
                              fullWidth: true,
                              onPressed: () {
                                if (library.librarytype == "image") {
                                  OneContext().push(
                                    MaterialPageRoute(
                                      builder: (context) => ViewPhoto(
                                        imageProvider: NetworkImage(
                                          "${AppConstants.BASE_URL}/${library.link}",
                                        ),
                                      ),
                                    ),
                                  );
                                } else {}
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
    return SizedBox(
      height: 400,
      child: Card(
        color: Colors.white,
        // elevation: 0,
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
                leading: const SvgImage(
                  imageUrl:
                      "https://www.thepreparedacademy.com/assets/tempAssets/book-stack.svg",
                ),
                title: Text(
                  "Day ${activityModel.sequence}",
                  style: const TextStyle(
                    color: gGreen,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                subtitle: const Text(
                  "Library Activity",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
              const Text(
                "Chapter",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                activityModel.chapterName!.capitalize(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              libraryVidos(activityModel.libraries!),
            ],
          ),
        ),
      ),
    );
  }
}
