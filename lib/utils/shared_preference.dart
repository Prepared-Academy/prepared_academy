import 'package:rx_shared_preferences/rx_shared_preferences.dart';

void setBoolValue(String key, bool value) async {
  final myPrefs = RxSharedPreferences(await SharedPreferences.getInstance());
  myPrefs.setBool(key, value);
}

Future<bool?> getBoolValue(String key) async {
  final myPrefs = RxSharedPreferences(await SharedPreferences.getInstance());
  return myPrefs.getBool(key);
}

setStringValue(String key, String value) async {
  final myPrefs = RxSharedPreferences(await SharedPreferences.getInstance());
  myPrefs.setString(key, value);
}

setIntValue(String key, int value) async {
  final myPrefs = RxSharedPreferences(await SharedPreferences.getInstance());
  myPrefs.setInt(key, value);
}

Future<int?> getIntValue(String key) async {
  final myPrefs = RxSharedPreferences(await SharedPreferences.getInstance());
  return myPrefs.getInt(key);
}

Future<String?> getStringValue(String key) async {
  final myPrefs = RxSharedPreferences(await SharedPreferences.getInstance());
  return myPrefs.getString(key);
}

removeValue(String key) async {
  final myPrefs = RxSharedPreferences(await SharedPreferences.getInstance());
  return myPrefs.remove(key);
}

removeAll() async {
  final myPrefs = RxSharedPreferences(await SharedPreferences.getInstance());
  return myPrefs.clear();
}
