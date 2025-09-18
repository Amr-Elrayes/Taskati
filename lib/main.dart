import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/utils/app_theme.dart';
import 'package:taskati/features/splash/splash_screen.dart';
import 'package:taskati/services/local_helper.dart';

void main() async {
  await Hive.initFlutter();
  await LocalHelper.init();
  runApp(const Taskati());
}

class Taskati extends StatelessWidget {
  const Taskati({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LocalHelper.userBox.listenable(),
      builder: (context, box, child) {
        bool isDark = LocalHelper.getData(LocalHelper.isDark) ?? false;
        return MaterialApp(
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          darkTheme: AppTheme.dartTheme,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: SplashScreen(),
        );
      },
    );
  }
}
