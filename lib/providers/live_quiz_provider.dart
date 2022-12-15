import 'package:flutter/foundation.dart';

import '../setup.dart';
import '../utils/app_constants.dart';
import '../utils/shared_preference.dart';

class LiveQuizProvider extends ChangeNotifier {
  final _prefsLocator = getIt.get<SharedPreferencesHelper>();
  String token = "";

  void initToken() async {
    token = await _prefsLocator.getStringValue(AppConstants.TOKEN) ?? "";
  }
}
