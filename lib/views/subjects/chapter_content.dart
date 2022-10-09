import 'package:flutter/material.dart';
import 'package:prepared_academy/utils/app_constants.dart';

import '../../themes/color_theme.dart';

class ChapterContent extends StatefulWidget {
  const ChapterContent({super.key});

  @override
  State<ChapterContent> createState() => _ChapterContentState();
}

class _ChapterContentState extends State<ChapterContent> {
  List<Map<String, dynamic>> courseContentTypes = [
    {
      "colorcode1": const Color(0xff4285F4),
      "colorcode2": const Color(0xff4285F4).withOpacity(0.4),
      "icon": AppConstants.INFO_ICON,
    },
    {
      "colorcode1": const Color(0xffDB4437),
      "colorcode2": const Color(0xffDB4437).withOpacity(0.4),
      "icon": AppConstants.INFO_ICON,
    },
    {
      "colorcode1": const Color(0xff0F9D58),
      "colorcode2": const Color(0xff0F9D58).withOpacity(0.4),
      "icon": AppConstants.INFO_ICON,
    },
    {
      "colorcode1": const Color(0xffF4B400),
      "colorcode2": const Color(0xffF4B400).withOpacity(0.4),
      "icon": AppConstants.REWARDS_ICON,
    },
    {
      "colorcode1": Colors.pink,
      "colorcode2": Colors.pink.withOpacity(0.4),
      "icon": AppConstants.INFO_ICON,
    },
  ];
  final scrollController = ScrollController();

  Widget _customAppBar() => SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FloatingActionButton.small(
                        onPressed: () {},
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.grey.shade300,
                        elevation: 0,
                        child: const Icon(Icons.arrow_back),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Compiler Basics and Lexical Analysis",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: -70,
              top: -80,
              child: Image.asset(
                AppConstants.TOPICON1_ICON,
                height: 200,
              ),
            )
          ],
        ),
      );

  Widget _contentTypes() => Padding(
        padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            courseContentTypes.length,
            (index) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [
                      0.4,
                      0.9,
                    ],
                    colors: [
                      courseContentTypes[index]["colorcode1"],
                      courseContentTypes[index]["colorcode2"],
                    ],
                  )),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: 65,
              width: 65,
              child: Center(
                child: Image.asset(
                  courseContentTypes[index]["icon"],
                  height: 40,
                  width: 40,
                ),
              ),
            ),
          ),
        ),
      );

  Widget _divider() => Divider(
        height: 50,
        thickness: 2,
        indent: 16,
        endIndent: 16,
        color: Colors.blue.shade900,
      );

  Widget _lecturesVideos() => Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) => Opacity(
                  opacity: index == 0 ? 1.0 : 0.5,
                  child: Container(
                    height: 150,
                    margin:
                        const EdgeInsets.only(bottom: 30, left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: kBorder),
                        borderRadius: BorderRadius.circular(15)),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.2),
                                        BlendMode.darken),
                                    child: Image.asset(
                                      AppConstants.DEMOPOST_IMAGE,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Module 1".toUpperCase(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.bookmark_outline_rounded,
                                            color: kPrimaryColor,
                                          )
                                        ],
                                      ),
                                      const Text(
                                        "Introduction",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      const Divider(),
                                      Row(
                                        children: [
                                          Image.asset(
                                            index == 0
                                                ? AppConstants.CHECK_ICON
                                                : AppConstants.LOCK_ICON,
                                            height: 15,
                                            width: 15,
                                          ),
                                          const SizedBox(width: 5),
                                          const Text("Quiz Score : 0 / 5 "),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _customAppBar(),
            _contentTypes(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                color: kBlack,
                height: 1000,
              ),
            )
          ],
        ),
      ),
    );
  }
}
