import 'package:animation_wrappers/animations/scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/views/class_activities/view_activites/assignment.dart';
import 'package:prepared_academy/views/class_activities/view_activites/library_video.dart';
import 'package:prepared_academy/views/class_activities/view_activites/test.dart';
import 'package:provider/provider.dart';

import '../../../providers/class_activity_provider.dart';
import '../../../themes/color_theme.dart';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final arguments = (ModalRoute.of(context)?.settings.arguments ??
          <String, dynamic>{}) as Map;
      if (arguments.isNotEmpty) {
        Future.microtask(() => context
            .read<ClassActivityProvider>()
            .getActivities(arguments["activityId"]));
      }
    });
  }

  // Returns the activity text based on the typeId.
  String activityText(int typeId) {
    switch (typeId) {
      case 1:
        return 'Baseline Test';

      case 2:
        return 'Assignment Activity';

      case 3:
        return 'Video Activity';

      case 4:
        return 'Quiz Activity';

      case 7:
        return 'Library Activity';

      default:
        return 'Profile';
    }
  }

  String activityImage(int typeId) {
    switch (typeId) {
      case 1:
        return 'https://www.thepreparedacademy.com/assets/tempAssets/test_activity.svg';

      case 2:
        return 'https://www.thepreparedacademy.com/assets/tempAssets/assignment_activity.svg';

      case 3:
        return 'https://www.thepreparedacademy.com/assets/tempAssets/video_activity.svg';

      case 4:
        return 'https://www.thepreparedacademy.com/assets/tempAssets/quiz_activity.svg';

      case 7:
        return 'https://www.thepreparedacademy.com/assets/tempAssets/book-stack.svg';

      default:
        return '';
    }
  }

  Color acitvityColor(int typeId) {
    switch (typeId) {
      case 1:
        return gBlue;

      case 2:
        return gRed;

      case 3:
        return gYellow;

      case 4:
        return gBlue;

      case 7:
        return gGreen;

      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activities"),
      ),
      body: Consumer<ClassActivityProvider>(
        builder: (context, provider, __) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            itemCount: provider.activities.length,
            itemBuilder: (context, index) {
              final activity = provider.activities[index];
              return ScaleAnimation(
                  child: activity.typeId == 1
                      ? ClassTest(activityModel: activity)
                      : activity.typeId == 2
                          ? Assignment(activityModel: activity)
                          : activity.typeId == 7
                              ? LibraryVideo(activityModel: activity)
                              : const SizedBox());
            },
          );
        },
      ),
    );
  }
}
