import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {
  // THEME_MODE
  RxString settingThemeMode = 'dark'.obs;

  // SHOW_DATE
  RxBool settingShowDate = false.obs;

  // SHOW_SECOND
  RxBool settingShowSecond = true.obs;

  // AMBIENT_SOUND
  RxString settingAmbientSound = 'sound/ocean.mp3'.obs;

  late SharedPreferences prefs;

  AudioPlayer player = AudioPlayer();
  RxBool isPlay = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadSettingsPreference();
  }

  loadSettingsPreference() async {
    prefs = await SharedPreferences.getInstance();
    settingThemeMode.value = prefs.getString('THEME_MODE') ?? 'dark';
    settingAmbientSound.value =
        prefs.getString('AMBIENT_SOUND') ?? 'sound/ocean.mp3';
    settingShowSecond.value = prefs.getBool('SHOW_SECOND') ?? false;
  }
}
