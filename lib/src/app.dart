import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_themes.dart';
import 'routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.login,
      getPages: Routes.getPages,
      theme: AppThemes.light,
      darkTheme: AppThemes.light,
    );
  }
}
