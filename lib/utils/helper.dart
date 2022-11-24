import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:one_context/one_context.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:timeago/timeago.dart' as timeago;

final dialogContext = OneContext().dialog.context!;

Future loadingStop() async {
  EasyLoading.dismiss();
}

Future loadingShow() async {
  EasyLoading.show(status: 'Loading...');
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
