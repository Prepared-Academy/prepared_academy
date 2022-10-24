import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class NotificationsService {
  static showSnackbar(String message) {
    OneContext().showSnackBar(builder: (_) => SnackBar(content: Text(message)));
  }
}
