import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fullscreen_window/fullscreen_window.dart';
import 'package:get/get.dart';
import 'package:standby_clock/controllers/app_controller.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'pages/home.dart';

Future<void> main() async {
  // widget init
  WidgetsFlutterBinding.ensureInitialized();

  // init controller
  Get.put(AppController());

  // set fullscreen for mobile platform
  setFullScreen();

  // run app
  runApp(const MyApp());
}

// set fullscreen for mobile platform
setFullScreen() {
  if (Platform.isAndroid || Platform.isIOS) {
    // set fullscreen
    FullScreenWindow.setFullScreen(true);
    // enable wake lock
    WakelockPlus.enable();
  }
}

class MyApp extends GetView<AppController> {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = (controller.settingThemeMode.value == 'dark')
        ? ThemeMode.dark
        : (controller.settingThemeMode.value == 'light')
            ? ThemeMode.light
            : ThemeMode.system;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Standby Clock',
      themeMode: themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.deepPurple,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}
