import 'package:hive/hive.dart';
import 'package:taskati/core/model/task_model.dart';

class AppLocalStorage {
  static String kIsUploaded = 'isUploaded';
  static String kIsDarkMode = 'isDarkMode';
  static String kUsername = 'name';
  static String kUserImage = 'image';

  static late Box userBox;
  static late Box<TaskModel> taskBox;
  static init() {
    userBox = Hive.box('userBox');
    taskBox = Hive.box('taskBox');
  }

  static cacheData(String key, value) {
    userBox.put(key, value);
  }

  static getCachedData(String key) {
    return userBox.get(key);
  }

  static cacheTask(String key, TaskModel value) {
    taskBox.put(key, value);
  }

  static TaskModel? getCachedTask(String key) {
    return taskBox.get(key);
  }
}
