import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {

  Future<void> saveStringToPrefs(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
  print(value);
  }

  Future<String?> getStringFromPrefs(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('username is : ${prefs.getString(key)}');
  return prefs.getString(key);
}

  Future<void> setLastVisitedScreen(String screenName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastScreen', screenName);
  }
}