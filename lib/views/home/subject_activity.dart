import 'package:animation_wrappers/animations/scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/providers/class_activity_provider.dart';
import 'package:prepared_academy/utils/helper.dart';
import 'package:prepared_academy/utils/validator.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:prepared_academy/widgets/svg_image.dart';
import 'package:provider/provider.dart';
import '../../routes/router.dart';
import '../../themes/color_theme.dart';
import '../../utils/app_constants.dart';

class SubjectActivites extends StatefulWidget {
  const SubjectActivites({super.key});

  @override
  State<SubjectActivites> createState() => _SubjectActivitesState();
}

class _SubjectActivitesState extends State<SubjectActivites> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final arguments = (ModalRoute.of(context)?.settings.arguments ??
          <String, dynamic>{}) as Map;
      if (arguments.isNotEmpty) {
        Future.microtask(() => context
            .read<ClassActivityProvider>()
            .getSubjectActivities(arguments["subjectId"]));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Class activities"),
      ),
      body: Consumer<ClassActivityProvider>(
        builder: (context, provider, __) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            itemCount: provider.subjectActivities.length,
            itemBuilder: (context, index) {
              final activity = provider.subjectActivities[index];
              return ScaleAnimation(
                child: SizedBox(
                  height: 250,
                  child: Card(
                    color: Colors.white,
                    elevation: 0,
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
                                Text(
                                  activity.activityName!.capitalize(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Divider(height: 30),
                                Text("${activity.days!} Day includes"),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(
                                    activity.types!.length,
                                    (index) => Padding(
                                        padding: EdgeInsets.only(
                                          left: index == 0 ? 0 : 10,
                                        ),
                                        child: SvgImage(
                                          imageUrl:
                                              "${AppConstants.BASE_URL}/assets/tempAssets/${activity.types![index].activityImage}",
                                        )),
                                  ),
                                ),
                                const Spacer(),
                                const Divider(height: 30),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Live on: ${returnDateOnly(activity.publishDate!)}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    MiniElevatedButton(
                                        onPressed: () {
                                          OneContext().pushNamed(
                                              AppRoutes.ACTIVITIES,
                                              arguments: {
                                                "activityId":
                                                    activity.activityId!
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
