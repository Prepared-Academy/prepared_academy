import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/models/activity_model.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/themes/color_theme.dart';

import 'package:prepared_academy/widgets/buttons.dart';
import 'package:prepared_academy/widgets/svg_image.dart';

class ClassTest extends StatelessWidget {
  final ActivityModel activityModel;
  const ClassTest({super.key, required this.activityModel});

  Widget chapterNames(List<Chapter> chapterList) => SizedBox(
        height: 33,
        child: Expanded(
          child: ListView.builder(
              // itemExtent: 200,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: chapterList.length,
              itemBuilder: (context, index) {
                final chapter = chapterList[index];
                return Text(
                  "• ${chapter.chapterName!} ",
                );
              }),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(color: kBorder)),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 300),
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
                                "https://www.thepreparedacademy.com/assets/tempAssets/test_activity.svg"),
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
                          Container(
                            decoration: BoxDecoration(
                              color: const Color((0xffffc14b)),
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(7)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Total Marks - ',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: activityModel.totalM.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color((0xffffc14b)),
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(7)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Time Alloted - ',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: activityModel.testDuration
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0.0, vertical: 7),
                        child: Text(
                          'Chapters Included :',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      chapterNames(activityModel.chapters!),
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
          ),
        ));
  }
}
