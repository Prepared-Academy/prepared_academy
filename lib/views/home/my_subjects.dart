// ignore_for_file: must_be_immutable

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/utils/app_constants.dart';

class MySubjects extends StatelessWidget {
  MySubjects({super.key});

  List<Map<String, dynamic>> coursesList = [
    {
      "name": "Mathematics",
      "desc": "Academind by Maximilian Schwarzmuller",
      "progress": 50,
    },
    {
      "name": "Biology",
      "desc": "Academind by Maximilian Schwarzmuller",
      "progress": 100,
    },
    {
      "name": "Physics",
      "desc": "Academind by Maximilian Schwarzmuller",
      "progress": 25,
    },
    {
      "name": "Chemistry",
      "desc": "Academind by Maximilian Schwarzmuller",
      "progress": 0,
    },
    {
      "name": "Physics",
      "desc": "Academind by Maximilian Schwarzmuller",
      "progress": 25,
    },
    {
      "name": "Chemistry",
      "desc": "Academind by Maximilian Schwarzmuller",
      "progress": 0,
    },
  ];
  final scrollController = ScrollController();
  final listShowItemDuration = const Duration(milliseconds: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("All subjects"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 30,
            floating: true,
            centerTitle: false,
            automaticallyImplyLeading: false,
            backgroundColor: kPrimaryColor,
            foregroundColor: Colors.white,
            title: ScaleAnimation(
              child: const Text(
                "Grade: 6   Total Subjects: 4",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
          LiveSliverList(
            delay: const Duration(milliseconds: 100) * 5,
            itemCount: coursesList.length,
            controller: scrollController,
            itemBuilder: ((context, index, animation) => FadeTransition(
                  opacity: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(animation),
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, -0.1),
                      end: Offset.zero,
                    ).animate(animation),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(
                            bottom: 5, top: 16, right: 16, left: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: Image.asset(
                                AppConstants.DEMOPOST_IMAGE,
                                height: 43,
                                width: 43,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    coursesList[index]["name"],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    coursesList[index]["desc"],
                                    style: TextStyle(
                                        fontSize: 9,
                                        color: Colors.grey.shade800),
                                  ),
                                  const SizedBox(height: 2),
                                  LinearPercentIndicator(
                                    barRadius: const Radius.circular(100),
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    animation: true,
                                    lineHeight: 3.0,
                                    percent: 0.5,
                                    padding: EdgeInsets.zero,
                                    backgroundColor:
                                        kPrimaryColor.withOpacity(0.1),
                                    progressColor: kPrimaryColor,
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    "99% complete",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey.shade600),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
