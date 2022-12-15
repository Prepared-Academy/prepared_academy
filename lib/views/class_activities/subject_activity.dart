import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/providers/class_activity_provider.dart';
import 'package:prepared_academy/shimmers/subject_activity_shimmer.dart';
import 'package:prepared_academy/utils/helper.dart';
import 'package:prepared_academy/utils/validator.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:provider/provider.dart';
import '../../routes/router.dart';
import '../../themes/color_theme.dart';

class SubjectActivites extends StatefulWidget {
  const SubjectActivites({super.key});

  @override
  State<SubjectActivites> createState() => _SubjectActivitesState();
}

class _SubjectActivitesState extends State<SubjectActivites> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<ClassActivityProvider>().getSubjectActivities());
  }

  String activityImage(String typeName) {
    switch (typeName) {
      case 'Library':
        return 'assets/inclass/library.png';

      case 'ChapterVideo':
        return 'assets/inclass/video.png';

      case 'BaselineTest':
        return 'assets/inclass/test.png';

      case 'Assignment':
        return 'assets/inclass/assignment.png';

      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Class activities")),
      body: RefreshIndicator(
        onRefresh: context.read<ClassActivityProvider>().getSubjectActivities,
        child: Consumer<ClassActivityProvider>(
          builder: (context, provider, __) {
            return provider.isLoading
                ? const SubjectActivityShimmer()
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    itemCount: provider.subjectActivities.length,
                    itemBuilder: (context, index) {
                      final activity = provider.subjectActivities[index];
                      return SizedBox(
                        height: 250,
                        child: Card(
                          elevation: 0,
                          margin: const EdgeInsets.only(bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(color: kBorder)),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  context
                                      .read<ClassActivityProvider>()
                                      .activityId = activity.activityId!;
                                  OneContext().pushNamed(AppRoutes.ACTIVITIES);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        activity.activityName!.capitalize(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Divider(height: 30),
                                      Text("${activity.days!} Day includes"),
                                      const SizedBox(height: 10),
                                      Expanded(
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: activity.types!.length,
                                          itemBuilder: (context, index) =>
                                              activityImage(activity
                                                          .types![index]
                                                          .typeName!) ==
                                                      ""
                                                  ? const SizedBox()
                                                  : Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10),
                                                      child: CircleAvatar(
                                                        radius: 34,
                                                        backgroundColor:
                                                            kPrimaryColor
                                                                .withOpacity(
                                                                    0.2),
                                                        child: CircleAvatar(
                                                          radius: 32,
                                                          backgroundColor:
                                                              Colors.white,
                                                          child: CircleAvatar(
                                                            radius: 28,
                                                            backgroundColor:
                                                                Colors.white,
                                                            backgroundImage: AssetImage(
                                                                activityImage(activity
                                                                    .types![
                                                                        index]
                                                                    .typeName!)),
                                                          ),
                                                        ),
                                                      )

                                                      //  SvgImage(
                                                      //   imageUrl:
                                                      //       "${AppConstants.BASE_URL}/assets/tempAssets/${activity.types![index].activityImage}",
                                                      // ),
                                                      ),
                                        ),
                                      ),
                                      // const Spacer(),
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
                                                context
                                                        .read<
                                                            ClassActivityProvider>()
                                                        .activityId =
                                                    activity.activityId!;
                                                OneContext().pushNamed(
                                                    AppRoutes.ACTIVITIES);
                                              },
                                              text: "View Activity")
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
