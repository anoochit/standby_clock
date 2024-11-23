import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standby_clock/data/ambient_sound.dart';

import '../controllers/app_controller.dart';

class SettingPage extends GetView<AppController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildThemeSetting(context),
          buildAmbientSoundSetting(context),
          buildSecondSetting(context)
        ],
      ),
    );
  }

  Widget buildSecondSetting(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Show secound',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          DropdownMenu<bool>(
            initialSelection: controller.settingShowSecond.value,
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
            ),
            onSelected: saveSecondMode,
            dropdownMenuEntries: const [
              DropdownMenuEntry<bool>(label: 'Yes', value: true),
              DropdownMenuEntry<bool>(label: 'No', value: false),
            ],
          )
        ],
      ),
    );
  }

  void saveSecondMode(value) {
    log('second mode : $value');
    controller.prefs.setBool('SHOW_SECOND', value);
    controller.settingShowSecond.value = value;
  }

  Widget buildThemeSetting(BuildContext context) {
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
            initialSelection: controller.settingThemeMode.value,
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
    controller.prefs.setString('THEME_MODE', value!);
    controller.settingThemeMode.value = value;
    Get.changeThemeMode(themeMode);
  }

  Widget buildAmbientSoundSetting(BuildContext context) {
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
            initialSelection: controller.settingAmbientSound.value,
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
            ),
            onSelected: saveAmbientSound,
            dropdownMenuEntries: List.generate(listAmbientSound.length, (i) {
              return DropdownMenuEntry<String>(
                label: listAmbientSound[i].title,
                value: listAmbientSound[i].asset,
              );
            }),
          )
        ],
      ),
    );
  }

  void saveAmbientSound(value) {
    log('sound selected : $value');
    controller.prefs.setString('AMBIENT_SOUND', value!);
    controller.settingAmbientSound.value = value;
  }
}
