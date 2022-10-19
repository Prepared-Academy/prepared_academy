import 'package:animation_wrappers/animations/scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:provider/provider.dart';

import '../../providers/class_activity_provider.dart';
import '../../routes/router.dart';
import '../../themes/color_theme.dart';
import '../../widgets/buttons.dart';
import '../../widgets/svg_image.dart';

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
        return 'Assignmnt Activity';

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
                child: SizedBox(
                  height: 250,
                  child: Card(
                    color: Colors.white,
                    // elevation: 0,
                    margin: const EdgeInsets.only(bottom: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: kBorder)),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  dense: true,
                                  contentPadding: const EdgeInsets.all(0),
                                  leading: SvgImage(
                                    imageUrl: activityImage(activity.typeId!),
                                  ),
                                  title: Text(
                                    "Day ${activity.sequence}",
                                    style: TextStyle(
                                      color: acitvityColor(activity.typeId!),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                  ),
                                  subtitle: Text(
                                    activityText(activity.typeId!),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const Divider(),
                                Text(
                                  "${activity.sequence!} Activity",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Divider(height: 30),
                                Text("${activity.sequence!} Day includes"),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Live on:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    MiniElevatedButton(
                                        onPressed: () {
                                          OneContext().pushNamed(
                                              AppRoutes.ACTIVITIES,
                                              arguments: {
                                                "activityId": provider
                                                    .inClassSubjects[index]
                                                    .activityId!
                                              });
                                        },
                                        text: "View Activity")
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
