import 'package:flutter/material.dart';

Duration animationDurationList = const Duration(milliseconds: 50) * 5;

class AnimationFadeList extends StatelessWidget {
  final Animation<double> animation;
  final Widget widget;
  const AnimationFadeList(
      {super.key, required this.widget, required this.animation});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          child: widget),
    );
  }
}

class AnimationScaleList extends StatelessWidget {
  final Animation<double> animation;
  final Widget widget;
  const AnimationScaleList(
      {super.key, required this.widget, required this.animation});

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          child: widget),
    );
  }
}
