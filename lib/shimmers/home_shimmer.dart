// ignore_for_file: library_private_types_in_public_api

import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class HomeShimmer extends StatefulWidget {
  const HomeShimmer({Key? key}) : super(key: key);

  @override
  _HomeShimmerState createState() => _HomeShimmerState();
}

class _HomeShimmerState extends State<HomeShimmer> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
                color:
                    isDarkMode ? const Color(0xff242424) : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    3,
                    (index) => Padding(
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
                        child: FadeShimmer.round(
                          size: 60,
                          fadeTheme:
                              isDarkMode ? FadeTheme.dark : FadeTheme.light,
                          millisecondsDelay: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (_, i) {
                return Container(
                  decoration: BoxDecoration(
                      color: isDarkMode
                          ? const Color(0xff242424)
                          : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const FadeShimmer(
                        height: 50,
                        width: 50,
                        radius: 10,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeShimmer(
                            height: 8,
                            width: 150,
                            radius: 4,
                            millisecondsDelay: 0,
                            fadeTheme:
                                isDarkMode ? FadeTheme.dark : FadeTheme.light,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          FadeShimmer(
                            height: 8,
                            millisecondsDelay: 0,
                            width: 170,
                            radius: 4,
                            fadeTheme:
                                isDarkMode ? FadeTheme.dark : FadeTheme.light,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: 3,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
            ),
          ),
          const SizedBox(height: 10),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, i) {
              return Container(
                height: 200,
                decoration: BoxDecoration(
                    color: isDarkMode
                        ? const Color(0xff242424)
                        : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      leading: FadeShimmer.round(
                        size: 55,
                        fadeTheme:
                            isDarkMode ? FadeTheme.dark : FadeTheme.light,
                        millisecondsDelay: 0,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeShimmer(
                            height: 8,
                            width: 150,
                            radius: 4,
                            millisecondsDelay: 0,
                            fadeTheme:
                                isDarkMode ? FadeTheme.dark : FadeTheme.light,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          FadeShimmer(
                            height: 8,
                            millisecondsDelay: 0,
                            width: 170,
                            radius: 4,
                            fadeTheme:
                                isDarkMode ? FadeTheme.dark : FadeTheme.light,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: 4,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
          ),
        ],
      ),
    );
  }
}
