import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_context/one_context.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:timeago/timeago.dart' as timeago;

final dialogContext = OneContext().dialog.context!;

Future loadingStop() async {
  Navigator.pop(dialogContext);
}

Future loadingShow() async {
  await QuickAlert.show(
    barrierDismissible: false,
    context: dialogContext,
    type: QuickAlertType.loading,
    title: 'Loading',
    text: 'Please wait',
  );
}

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
