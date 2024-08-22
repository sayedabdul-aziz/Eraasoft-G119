import 'package:hive/hive.dart';

class AppLocalStorage {
  static String kIsUploaded = 'isUploaded';
  static String kUsername = 'name';
  static String kUserImage = 'image';

  static late Box userBox;
  static init() {
    userBox = Hive.box('userBox');
  }

  static cacheData(String key, value) {
    userBox.put(key, value);
  }

  static getCachedData(String key) {
    return userBox.get(key);
  }
}
