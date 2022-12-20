import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_context/one_context.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:timeago/timeago.dart' as timeago;

final dialogContext = OneContext().dialog.context!;

// Future loadingStop() async {
//   EasyLoading.dismiss();
// }

// Future loadingShow() async {
//   EasyLoading.show(status: 'Loading...');
// }

Future successRegister() async {
  await QuickAlert.show(
    context: dialogContext,
    type: QuickAlertType.success,
    text: 'Verification link sent',
  );
}

String returnTimeAgo(DateTime dateTime) {
  final fifteenAgo = dateTime;
  String agoTime = timeago.format(fifteenAgo);

  return agoTime;
}

String returnDateOnly(DateTime dateTime) {
  String convertedDate = DateFormat("dd/MM/yyyy").format(dateTime);
  return convertedDate;
}

// test() {
//   var activity1 = DateTime.now().add(const Duration(days: 1));
//   var activity2 = DateTime.now().add(const Duration(days: 2));
//   var activity3 = DateTime.now().add(const Duration(days: 3));

//   List<DateTime> acti = [activity1, activity2, activity3];

//   var now = DateTime.now();

//   for (var i = 0; i < acti.length; i++) {
//     if (acti[i].isAfter(now)) {
//       debugPrint("Lock");
//     } else if (acti[i] == now) {
//       debugPrint("Un Lock");
//     } else {
//       // acti[i].isBefore(now)
//       if ("status" == "true") {
//         debugPrint("Submitted");
//         debugPrint("locked");
//       } else {
//         debugPrint("Expired");
//         debugPrint("locked");
//       }
//     }
//   }
// }

// fetchpostbytime() {
//   final todayDate = DateTime.now();

//   final start =
//       getDate(todayDate.subtract(Duration(days: todayDate.weekday - 1)));

//   final end = getDate(
//       todayDate.add(Duration(days: DateTime.daysPerWeek - todayDate.weekday)));

//   List data = [];

//   data.where(
//       (element) => element["postData"] >= start && element["postData"] <= end);
// }

// DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

Future<bool?> showExitPopup() async {
  return await OneContext().showDialog<bool>(builder: (_) {
    return AlertDialog(
      content: SizedBox(
        height: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Want to Exit the app!"),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: const Text("Yes",
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    OneContext().pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade800,
                  ),
                  child:
                      const Text("No", style: TextStyle(color: Colors.white)),
                ))
              ],
            )
          ],
        ),
      ),
    );
  });
}

Future<bool> onWillPop() async {
  return await OneContext().showDialog(
        builder: (_) => AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you want to exit an App'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(_).pop(false), //<-- SEE HERE
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(_).pop(true), // <-- SEE HERE
              child: const Text('Yes'),
            ),
          ],
        ),
      ) ??
      false;
}

String activityDateCheck(DateTime activityDate, bool? submitStatus) {
  var now = DateTime.now();
  var time = DateTime(now.year, now.month, now.day, 0, 0, 0, 0, 0);

  String y = "lock";

  // debugPrint(activityDate.toString());
  // debugPrint(time.toString());

  // 1. Lock
  // 2. UnLock
  // 3. beforeAndSubmit
  // 4. beforeAndNotSubmit

  if (activityDate.isAfter(time)) {
    // debugPrint("Lock");
    y = "lock";
  } else if (activityDate == time) {
    // debugPrint("UnLock");
    y = "unlock";
  } else {
    if (submitStatus == null) {
    } else if (submitStatus == true) {
      // debugPrint("Submitted");
      // debugPrint("beforeAndSubmit");
      y = "beforeAndSubmit";
    } else {
      // debugPrint("Expired");
      // debugPrint("beforeAndNotSubmit");
      y = "beforeAndNotSubmit";
    }
  }
  return y;
}
