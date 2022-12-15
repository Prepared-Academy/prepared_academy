// ignore_for_file: library_private_types_in_public_api

import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class DefaultShimmer extends StatefulWidget {
  const DefaultShimmer({Key? key}) : super(key: key);

  @override
  _DefaultShimmerState createState() => _DefaultShimmerState();
}

class _DefaultShimmerState extends State<DefaultShimmer> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, i) {
        return Container(
          decoration: BoxDecoration(
              color:
                  isDarkMode ? const Color(0xff242424) : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              FadeShimmer.round(
                size: 60,
                fadeTheme: isDarkMode ? FadeTheme.dark : FadeTheme.light,
                millisecondsDelay: 0,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeShimmer(
                    height: 8,
                    width: 150,
                    radius: 4,
                    millisecondsDelay: 0,
                    fadeTheme: isDarkMode ? FadeTheme.dark : FadeTheme.light,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  FadeShimmer(
                    height: 8,
                    millisecondsDelay: 0,
                    width: 170,
                    radius: 4,
                    fadeTheme: isDarkMode ? FadeTheme.dark : FadeTheme.light,
                  ),
                ],
              )
            ],
          ),
        );
      },
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
    );
  }
}
