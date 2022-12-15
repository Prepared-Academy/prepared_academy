import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:intl/intl.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/models/activity_model.dart';
import 'package:prepared_academy/utils/helper.dart';
import 'package:prepared_academy/utils/validator.dart';

import '../../../routes/router.dart';
import '../../../themes/color_theme.dart';
import '../../../utils/app_constants.dart';
import '../../../widgets/buttons.dart';

class Assignment extends StatelessWidget {
  final ActivityModel activityModel;
  const Assignment({super.key, required this.activityModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
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
            height: 250,
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
                    onTap: () {},
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
                                  AssetImage("assets/inclass/assignment.png"),
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
                                  "Assignmnt Activity",
                                ),
                                Text(
                                  "Unlock Date: ${DateFormat.yMMMMd('en_US').format(activityModel.activityDate!)}",
                                ),
                              ],
                            ),
                          ),
                          Text(
                            activityModel.title!.capitalize(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "Question:",
                          ),
                          HtmlWidget(activityModel.assignmentQuestion!),
                          const Spacer(),
                          activityDateCheck(activityModel.activityDate!,
                                      activityModel.submitStatus!) ==
                                  "beforeAndSubmit"
                              ? MiniElevatedButton(
                                  fullWidth: true,
                                  onPressed: null,
                                  text: activityModel.score == null
                                      ? "Assignment Submitted"
                                      : "Assignment Score ${activityModel.score} / 10",
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
                                        OneContext().pushNamed(
                                            AppRoutes.ASSIGNMENTACTIVITY,
                                            arguments: {
                                              "id": activityModel.id
                                            });
                                      },
                                      text: "Launch Assignment"),
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ),
        activityDateCheck(
                    activityModel.activityDate!, activityModel.submitStatus!) ==
                "lock"
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
