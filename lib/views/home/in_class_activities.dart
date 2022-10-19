// ignore_for_file: must_be_immutable

import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/animation/animation_list.dart';
import 'package:prepared_academy/providers/class_activity_provider.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:prepared_academy/widgets/cached_image.dart';
import 'package:provider/provider.dart';

class InClassActivities extends StatefulWidget {
  const InClassActivities({super.key});

  @override
  State<InClassActivities> createState() => _InClassActivitiesState();
}

class _InClassActivitiesState extends State<InClassActivities> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<ClassActivityProvider>().getMyInClassSubjects());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("In class activities")),
      body: Consumer<ClassActivityProvider>(builder: (context, provider, __) {
        return LiveGrid(
          padding: const EdgeInsets.all(16),
          itemCount: provider.inClassSubjects.length,
          controller: scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: ((context, index, animation) => AnimationFadeList(
                animation: animation,
                widget: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          color: Colors.grey.shade200,
                          spreadRadius: 1)
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        OneContext().pushNamed(AppRoutes.SUBJECTACTIVITIES,
                            arguments: {
                              "subjectId":
                                  provider.inClassSubjects[index].subjectId!
                            });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedImage(
                            imageUrl:
                                "${AppConstants.BASE_URL}/upload/subjectPic/${provider.inClassSubjects[index].image1!}",
                          ),
                          const SizedBox(height: 10),
                          Text(
                            provider.inClassSubjects[index].name!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        );
      }),
    );
  }
}
