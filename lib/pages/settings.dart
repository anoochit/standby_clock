import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standby_clock/data/ambient_sound.dart';
import 'package:standby_clock/main.dart';

import '../data/settings.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildThemeSetting(),
        buildAmbientSoundSetting(),
      ],
    );
  }

  Widget buildThemeSetting() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Theme',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          DropdownMenu<String>(
            initialSelection: settingThemeMode,
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
            ),
            onSelected: saveThemeMode,
            dropdownMenuEntries: const [
              DropdownMenuEntry<String>(label: 'Light', value: 'light'),
              DropdownMenuEntry<String>(label: 'Dark', value: 'dark'),
            ],
          )
        ],
      ),
    );
  }

  void saveThemeMode(value) {
    log('theme selected : $value');
    final themeMode = (value == 'dark') ? ThemeMode.dark : ThemeMode.light;
    prefs.setString('THEME_MODE', value!);
    settingThemeMode = value;
    Get.changeThemeMode(themeMode);
  }

  Widget buildAmbientSoundSetting() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Sound',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          DropdownMenu<String>(
            initialSelection: settingAmbientSound,
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
            ),
            onSelected: saveAmbientSound,
            dropdownMenuEntries: List.generate(listAmbientSound.length, (i) {
              return DropdownMenuEntry<String>(
                  label: listAmbientSound[i].title,
                  value: listAmbientSound[i].asset);
            }),
          )
        ],
      ),
    );
  }

  void saveAmbientSound(value) {
    //
    log('sound selected : $value');
    prefs.setString('AMBIENT_SOUND', value!);
    settingAmbientSound = value;
  }
}
