import 'package:flutter/material.dart';
import 'package:prepared_academy/utils/app_constants.dart';

class LockActivity extends StatelessWidget {
  final DateTime dateTime;
  final Widget child;
  const LockActivity({super.key, required this.dateTime, required this.child});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 10),
            child: Opacity(
              opacity: true == true ? 1 : 0.4,
              child: child,
            ),
          ),
          true == true
              ? const SizedBox()
              : Image.asset(
                  AppConstants.ACTIVITYLOCK_ICON,
                  height: 60,
                ),
        ],
      ),
    );
  }
}
