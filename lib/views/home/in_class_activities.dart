// ignore_for_file: must_be_immutable

import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/animation/animation_list.dart';
import 'package:prepared_academy/providers/class_activity_provider.dart';
import 'package:provider/provider.dart';

class InClassActivities extends StatefulWidget {
  const InClassActivities({super.key});

  @override
  State<InClassActivities> createState() => _InClassActivitiesState();
}

class _InClassActivitiesState extends State<InClassActivities> {
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

  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<ClassActivityProvider>().getMyInClassSubjects());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("In class activities"),
      ),
      body: LiveGrid(
        padding: const EdgeInsets.all(16),
        itemCount: coursesList.length,
        controller: scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
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
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          coursesList[index]["name"].toUpperCase(),
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
      ),
    );
  }
}
