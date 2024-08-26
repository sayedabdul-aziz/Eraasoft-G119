import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/themes.dart';
import 'package:taskati/feature/intro/splash_view.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('userBox');
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('taskBox');
  AppLocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light));
    return ValueListenableBuilder(
      valueListenable: AppLocalStorage.userBox.listenable(),
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode:
              AppLocalStorage.getCachedData(AppLocalStorage.kIsDarkMode) ??
                      false
                  ? ThemeMode.dark
                  : ThemeMode.light,
          darkTheme: AppThemes.darkTheme,
          theme: AppThemes.lightTheme,
          home: const SplashView(),
        );
      },
    );
  }
}
