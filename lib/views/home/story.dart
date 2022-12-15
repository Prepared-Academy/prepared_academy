import 'package:animation_wrappers/animations/fade_animation.dart';
import 'package:animation_wrappers/animations/scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:provider/provider.dart';

import '../../providers/home_provider.dart';
import '../../routes/router.dart';
import '../../themes/color_theme.dart';
import '../../utils/app_constants.dart';

class Story extends StatelessWidget {
  const Story({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: kPrimaryColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeAnimation(
                child: const Text(
              "Perals of wisdom",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            )),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                AppConstants.storyList.length,
                (index) => ScaleAnimation(
                  child: GestureDetector(
                    onTap: () {
                      context.read<HomeProvider>().storyView(index: index);
                      OneContext().pushNamed(AppRoutes.STORYVIEW);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.grey,
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                              AppConstants.storyList[index]["image"]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
