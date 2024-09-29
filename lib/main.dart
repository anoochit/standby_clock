import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fullscreen_window/fullscreen_window.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:standby_clock/data/settings.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'pages/home.dart';

late SharedPreferences prefs;

Future<void> main() async {
  // widget init
  WidgetsFlutterBinding.ensureInitialized();

  // init shared preference
  await initSharePreference();

  // load preference
  loadSettingsPreference();

  // set fullscreen for mobile platform
  setFullScreen();

  // run app
  runApp(const MyApp());
}

// set fullscreen for mobile platform
// TODO : should set full screen every platforms
setFullScreen() {
  if (Platform.isAndroid || Platform.isIOS) {
    // set fullscreen
    FullScreenWindow.setFullScreen(true);
    // enable wake lock
    WakelockPlus.enable();
  }
}

// init shared preference
initSharePreference() async {
  prefs = await SharedPreferences.getInstance();
}

loadSettingsPreference() {
  settingThemeMode = prefs.getString('THEME_MODE') ?? 'dark';
  settingAmbientSound = prefs.getString('AMBIENT_SOUND') ?? 'sound/ocean.mp3';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = (settingThemeMode == 'dark')
        ? ThemeMode.dark
        : (settingThemeMode == 'light')
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
