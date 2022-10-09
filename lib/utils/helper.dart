import 'package:flutter/material.dart';

funtion() {
  final subs = DateTime.now().add(const Duration(days: 60));
  final now = DateTime.now();

  if (now.isBefore(subs)) {
    debugPrint("True");
    Duration diff = now.difference(subs);
    debugPrint("Total Days Left: ${diff.inDays}");

    // put diff.inDays in some built in counter package to show total time left
    // also listen countdown values in background (If countdown is Zero  or Days | Hours | Seconds == 0)

  } else {
    // Unsubscribe user because current time is not before subscription time
  }
}


// Also use this package
// to show countdown for how many days left
// for subscription ending.

// slide_countdown: ^0.3.4
// 
// final streamDuration = StreamDuration(const Duration(hours: 2));

// SlideCountdown(
//   // This duration no effect if you customize stream duration
//   duration: const Duration(seconds: 10),
//   streamDuration: streamDuration,
// ),

