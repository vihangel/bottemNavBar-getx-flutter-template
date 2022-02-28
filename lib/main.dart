import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cronodoro/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cronodoro/pages/dashboard/dashboard.dart';
import 'package:cronodoro/pages/dashboard/dashboard_binding.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  await GetStorage.init();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primary,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => GetMaterialApp(
        title: 'Cronodoro',
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        initialRoute: "/",
        initialBinding: DashboardBinding(),
        getPages: [
          GetPage(
            name: "/",
            page: () => MyDashBoard(),
          ),
        ],
      ),
    );
  }
}
