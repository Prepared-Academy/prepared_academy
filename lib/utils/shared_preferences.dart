import 'package:shared_preferences/shared_preferences.dart';

Future<bool> setBoolValue(String key, bool value) async {
  SharedPreferences myPrefs = await SharedPreferences.getInstance();
  myPrefs.setBool(key, value);

  return myPrefs.setBool(key, value);
}

Future<bool?> getBoolValue(String key) async {
  SharedPreferences myPrefs = await SharedPreferences.getInstance();
  bool? isSwitchedFT = myPrefs.getBool(key);

  return isSwitchedFT;
}

setStringValue(String key, String value) async {
  SharedPreferences myPrefs = await SharedPreferences.getInstance();
  myPrefs.setString(key, value);
}

setIntValue(String key, int value) async {
  SharedPreferences myPrefs = await SharedPreferences.getInstance();
  myPrefs.setInt(key, value);
}

Future<int> getIntValue(String key) async {
  SharedPreferences myPrefs = await SharedPreferences.getInstance();
  return myPrefs.getInt(key) ?? -1;
}

Future<String> getStringValue(String key) async {
  SharedPreferences myPrefs = await SharedPreferences.getInstance();
  return myPrefs.getString(key) ?? "";
}

removeValue(String key) async {
  SharedPreferences myPrefs = await SharedPreferences.getInstance();
  return myPrefs.remove(key);
}

removeAll() async {
  SharedPreferences myPrefs = await SharedPreferences.getInstance();
  return myPrefs.clear();
}
