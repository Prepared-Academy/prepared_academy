import 'package:flutter/material.dart';

import '../../themes/color_theme.dart';
import '../../utils/app_constants.dart';

class Slides extends StatefulWidget {
  const Slides({super.key});

  @override
  State<Slides> createState() => _SlidesState();
}

class _SlidesState extends State<Slides> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slides"),
      ),
      body: ListView.builder(
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
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
  }
}
