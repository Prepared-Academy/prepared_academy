import 'package:flutter/material.dart';
import 'package:prepared_academy/providers/class_activity_provider.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:provider/provider.dart';

class LockActivity extends StatelessWidget {
  final int sequenceId;

  final Widget child;
  const LockActivity(
      {super.key, required this.sequenceId, required this.child});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        initialData: false,
        future: context
            .read<ClassActivityProvider>()
            .unlockActivityUpdate(sequenceId),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return IgnorePointer(
              ignoring: snapshot.data == true ? false : true,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 10),
                    child: Opacity(
                      opacity: snapshot.data == true ? 1 : 0.4,
                      child: child,
                    ),
                  ),
                  snapshot.data == true
                      ? const SizedBox()
                      : Image.asset(
                          AppConstants.ACTIVITYLOCK_ICON,
                          height: 60,
                        ),
                ],
              ),
            );
          }
        });
  }
}
