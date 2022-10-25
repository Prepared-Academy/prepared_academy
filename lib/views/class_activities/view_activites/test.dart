import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/models/activity_model.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/utils/validator.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:prepared_academy/widgets/svg_image.dart';

class ClassTest extends StatelessWidget {
  final ActivityModel activityModel;
  const ClassTest({super.key, required this.activityModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 220,
        child: Card(
          color: kWhite,
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
                      leading: const SvgImage(
                          imageUrl:
                              "https://www.thepreparedacademy.com/assets/tempAssets/assignment_activity.svg"),
                      title: Text(
                        "Day ${activityModel.sequence}",
                        style: const TextStyle(
                          color: gRed,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: const Text(
                        "Test Activity",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          activityModel.totalM.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          activityModel.testDuration.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MiniElevatedButton(
                            backgroundColor: activityModel.submitStatus == true
                                ? gGreen
                                : kPrimaryColor,
                            onPressed: activityModel.submitStatus == true
                                ? null
                                : () {
                                    OneContext().pushNamed(
                                        AppRoutes.TESTACTIVITY,
                                        arguments: {"id": activityModel.id});
                                  },
                            text: activityModel.submitStatus == true
                                ? "Test Submitted"
                                : "Launch Test")
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
