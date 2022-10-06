// ignore_for_file: must_be_immutable

import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/animation/animation_list.dart';

class InClassActivities extends StatelessWidget {
  InClassActivities({super.key});

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
