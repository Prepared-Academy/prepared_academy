import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/models/activity_model.dart';
import 'package:prepared_academy/utils/validator.dart';
import 'package:prepared_academy/widgets/lock_activity_widget.dart';

import '../../../routes/router.dart';
import '../../../themes/color_theme.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/svg_image.dart';

class Assignment extends StatelessWidget {
  final ActivityModel activityModel;
  const Assignment({super.key, required this.activityModel});

  @override
  Widget build(BuildContext context) {
    return LockActivity(
      sequenceId: activityModel.sequence!,
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
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.all(0),
                        leading: const SvgImage(
                          imageUrl:
                              "https://www.thepreparedacademy.com/assets/tempAssets/assignment_activity.svg",
                        ),
                        title: Text(
                          "Day ${activityModel.sequence}",
                          style: const TextStyle(
                            color: gRed,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: const Text(
                          "Assignmnt Activity",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                        activityModel.title!.capitalize(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MiniElevatedButton(
                              backgroundColor:
                                  activityModel.submitStatus == true
                                      ? gGreen
                                      : kPrimaryColor,
                              onPressed: activityModel.submitStatus == true
                                  ? null
                                  : () {
                                      OneContext().pushNamed(
                                          AppRoutes.ASSIGNMENTACTIVITY,
                                          arguments: {"id": activityModel.id});
                                    },
                              text: activityModel.submitStatus == true
                                  ? "Submitted"
                                  : "Launch assignment")
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
