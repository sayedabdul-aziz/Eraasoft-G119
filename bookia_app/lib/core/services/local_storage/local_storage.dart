import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static const String token = "token";

  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static cacheData({required String key, required dynamic value}) {
    if (value is String) {
      _sharedPreferences.setString(key, value);
    } else if (value is int) {
      _sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      _sharedPreferences.setBool(key, value);
    } else if (value is double) {
      _sharedPreferences.setDouble(key, value);
    } else {
      _sharedPreferences.setStringList(key, value);
    }
  }

  static dynamic getCachedData({required String key}) {
    return _sharedPreferences.get(key);
  }
}
