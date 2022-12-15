// ignore_for_file: depend_on_referenced_packages

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/providers/class_activity_provider.dart';
import 'package:prepared_academy/views/class_activities/chapter_test/test_activity.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:provider/provider.dart';
import 'package:stream_duration/stream_duration.dart';
import '../../../models/activity_model.dart';
import '../../../themes/color_theme.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/helper.dart';

class Test extends StatelessWidget {
  final ActivityModel activityModel;
  const Test({super.key, required this.activityModel});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(
          ignoring: activityDateCheck(activityModel.activityDate!,
                          activityModel.submitStatus!) ==
                      "lock" ||
                  activityDateCheck(activityModel.activityDate!,
                          activityModel.submitStatus!) ==
                      "beforeAndSubmit" ||
                  activityDateCheck(activityModel.activityDate!,
                          activityModel.submitStatus!) ==
                      "beforeAndNotSubmit"
              ? true
              : false,
          child: SizedBox(
            height: 220,
            child: Card(
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(color: kBorder)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      context.read<ClassActivityProvider>().testActivityId =
                          activityModel.id!;
                      context.read<ClassActivityProvider>().streamDuration =
                          StreamDuration(
                              Duration(minutes: activityModel.testDuration!));
                      OneContext().push(MaterialPageRoute(
                          builder: (_) => const TestActivity()));
                    },
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
                              backgroundImage:
                                  AssetImage("assets/inclass/test.png"),
                            ),
                            title: Text(
                              "Day ${activityModel.sequence}",
                              style: const TextStyle(
                                color: gYellow,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 5),
                                const Text(
                                  "Test Activity",
                                ),
                                Text(
                                  "Unlock Date: ${DateFormat.yMMMMd('en_US').format(activityModel.activityDate!)}",
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text("Total Marks: ${activityModel.totalM}"),
                              const Spacer(),
                              Text("Time - ${activityModel.testDuration} mins"),
                            ],
                          ),
                          const SizedBox(height: 10),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: activityModel.chapters!.length,
                              itemBuilder: (context, index) => Text(
                                  "* ${activityModel.chapters![index].chapterName}")),
                          const Spacer(),
                          activityDateCheck(activityModel.activityDate!,
                                      activityModel.submitStatus!) ==
                                  "beforeAndSubmit"
                              ? MiniElevatedButton(
                                  fullWidth: true,
                                  onPressed: null,
                                  text: activityModel.score == null
                                      ? "Test Submitted"
                                      : "Test Score ${activityModel.score} / ${activityModel.totalM}",
                                )
                              : activityDateCheck(activityModel.activityDate!,
                                          activityModel.submitStatus!) ==
                                      "beforeAndNotSubmit"
                                  ? const MiniElevatedButton(
                                      fullWidth: true,
                                      onPressed: null,
                                      text: "Expired",
                                    )
                                  : MiniElevatedButton(
                                      fullWidth: true,
                                      onPressed: () {
                                        context
                                            .read<ClassActivityProvider>()
                                            .testActivityId = activityModel.id!;
                                        context
                                                .read<ClassActivityProvider>()
                                                .streamDuration =
                                            StreamDuration(Duration(
                                                minutes: activityModel
                                                    .testDuration!));
                                        OneContext().push(MaterialPageRoute(
                                            builder: (_) =>
                                                const TestActivity()));
                                      },
                                      text: "Launch Test",
                                    )
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ),
        activityDateCheck(activityModel.activityDate!, true) == "lock"
            ? Center(
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: Container(
                      height: 370,
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
