import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/routes/router.dart';

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
          itemBuilder: (context, index) => Container(
                height: 100,
                margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: kBorder),
                    borderRadius: BorderRadius.circular(15)),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () => OneContext().pushNamed(AppRoutes.PDFVIEW),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15)),
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
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Slide 1".toUpperCase(),
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
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
