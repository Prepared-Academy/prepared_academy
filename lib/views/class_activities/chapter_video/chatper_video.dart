import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/models/activity_model.dart';
import 'package:prepared_academy/utils/validator.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import '../../../themes/color_theme.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/helper.dart';
import '../video_play.dart';

class ChapterVideo extends StatelessWidget {
  final ActivityModel activityModel;
  const ChapterVideo({super.key, required this.activityModel});

  Widget chapterVideos(List<Video> videoList) => SizedBox(
        height: 200,
        child: ListView.builder(
            itemExtent: 150,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: videoList.length,
            itemBuilder: (context, index) {
              final video = videoList[index];
              return Card(
                margin: const EdgeInsets.only(right: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(color: gPink, width: 1.5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: SizedBox(
                          height: 80,
                          child: Image.network(
                            "${AppConstants.BASE_URL}/upload/ObjectivePic/${video.objImage}",
                            fit: BoxFit.fitHeight,
                          )),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              video.title!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              video.description!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 14),
                            ),
                            const Spacer(),
                            activityDateCheck(activityModel.activityDate!,
                                            null) ==
                                        "lock" ||
                                    activityDateCheck(
                                            activityModel.activityDate!,
                                            true) ==
                                        "beforeAndSubmit" ||
                                    activityDateCheck(
                                            activityModel.activityDate!,
                                            true) ==
                                        "beforeAndNotSubmit"
                                ? MiniElevatedButton(
                                    fullWidth: true,
                                    onPressed: null,
                                    text: video.score != null
                                        ? "Score Score: ${video.score} / 5"
                                        : "Play Video",
                                  )
                                : MiniElevatedButton(
                                    fullWidth: true,
                                    backgroundColor: gPink,
                                    onPressed: video.score != null
                                        ? null
                                        : () {
                                            OneContext().push(
                                              MaterialPageRoute(
                                                builder: (_) => VideoPlay(
                                                  moduele: video.title,
                                                  description:
                                                      video.description,
                                                  videoUrl: video.objvideo!,
                                                  isChapterVideo: true,
                                                  objectiveId:
                                                      video.objectiveId,
                                                  objectiveVideoId:
                                                      video.objectiveVideoId,
                                                ),
                                              ),
                                            );
                                          },
                                    text: video.score != null
                                        ? "Score Score: ${video.score} / 5"
                                        : "Play Video",
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
      children: [
        SizedBox(
          height: 400,
          child: Card(
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
                      backgroundImage: AssetImage("assets/inclass/video.png"),
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
                          "Video Activity",
                        ),
                        Text(
                          "Unlock Date: ${DateFormat.yMMMMd('en_US').format(activityModel.activityDate!)}",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
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
                  chapterVideos(activityModel.videos!),
                ],
              ),
            ),
          ),
        ),
        activityDateCheck(activityModel.activityDate!, false) == "lock"
            ? Center(
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: Container(
                      height: 395,
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
