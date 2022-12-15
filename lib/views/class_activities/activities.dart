import 'package:flutter/material.dart';
import 'package:prepared_academy/shimmers/default_shimmer.dart';
import 'package:prepared_academy/views/class_activities/assignment/assignment.dart';
import 'package:prepared_academy/views/class_activities/chapter_test/test.dart';
import 'package:prepared_academy/views/class_activities/chapter_video/chatper_video.dart';
import 'package:prepared_academy/views/class_activities/library_video/library_video.dart';
import 'package:provider/provider.dart';

import '../../providers/class_activity_provider.dart';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<ClassActivityProvider>().getActivities());
  }

  // Returns the activity text based on the typeId.
  // String activityText(int typeId) {
  //   switch (typeId) {
  //     case 1:
  //       return 'Baseline Test';

  //     case 2:
  //       return 'Assignmnt Activity';

  //     case 3:
  //       return 'Video Activity';

  //     case 4:
  //       return 'Quiz Activity';

  //     case 7:
  //       return 'Library Activity';

  //     default:
  //       return 'Profile';
  //   }
  // }

  // String activityImage(int typeId) {
  //   switch (typeId) {
  //     case 1:
  //       return 'https://www.thepreparedacademy.com/assets/tempAssets/test_activity.svg';

  //     case 2:
  //       return 'https://www.thepreparedacademy.com/assets/tempAssets/assignment_activity.svg';

  //     case 3:
  //       return 'https://www.thepreparedacademy.com/assets/tempAssets/video_activity.svg';

  //     case 4:
  //       return 'https://www.thepreparedacademy.com/assets/tempAssets/quiz_activity.svg';

  //     case 7:
  //       return 'https://www.thepreparedacademy.com/assets/tempAssets/book-stack.svg';

  //     default:
  //       return '';
  //   }
  // }

  // Color acitvityColor(int typeId) {
  //   switch (typeId) {
  //     case 1:
  //       return gBlue;

  //     case 2:
  //       return gRed;

  //     case 3:
  //       return gYellow;

  //     case 4:
  //       return gBlue;

  //     case 7:
  //       return gGreen;

  //     default:
  //       return Colors.black;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day's Activities"),
      ),
      body: Consumer<ClassActivityProvider>(
        builder: (context, provider, __) {
          return provider.isLoading
              ? const DefaultShimmer()
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  itemCount: provider.activities.length,
                  itemBuilder: (context, index) {
                    final activity = provider.activities[index];
                    return activity.typeId == 2
                        ? Assignment(activityModel: activity)
                        : activity.typeId == 7
                            ? LibraryVideo(activityModel: activity)
                            : activity.typeId == 3
                                ? ChapterVideo(activityModel: activity)
                                : activity.typeId == 1
                                    ? Test(activityModel: activity)
                                    : const SizedBox();
                  },
                );
        },
      ),
    );
  }
}
