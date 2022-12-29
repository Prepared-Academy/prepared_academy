import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_context/one_context.dart';

class NotificationsService {
  static showSnackbar(String message) {
    OneContext().showSnackBar(builder: (_) => SnackBar(content: Text(message)));
  }

  static showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey.shade700,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static showErrorToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
