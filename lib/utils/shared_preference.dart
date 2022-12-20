import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class SharedPreferencesHelper {
  final RxSharedPreferences myPrefs;
  SharedPreferencesHelper({required this.myPrefs});

  void setBoolValue(String key, bool value) async {
    myPrefs.setBool(key, value);
  }

  Future<bool?> getBoolValue(String key) async {
    return myPrefs.getBool(key);
  }

  setStringValue(String key, String value) async {
    myPrefs.setString(key, value);
  }

  setIntValue(String key, int value) async {
    myPrefs.setInt(key, value);
  }

  Future<int?> getIntValue(String key) async {
    return myPrefs.getInt(key);
  }

  Future<String> getStringValue(String key) async {
    return await myPrefs.getString(key) ?? "";
  }

  Future<Stream<String?>> getStringStream(String key) async {
    return myPrefs.getStringStream(key);
  }

  removeValue(String key) async {
    return myPrefs.remove(key);
  }

  removeAll() async {
    return myPrefs.clear();
  }
}
