import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';

class AmbientSoundButton extends GetView<AppController> {
  const AmbientSoundButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        icon: Icon(
          (controller.isPlay.value) ? Icons.music_off : Icons.music_note,
        ),
        onPressed: () async {
          if (controller.isPlay.value) {
            log('stop');
            await controller.player.stop().then((_) {
              controller.isPlay.value = false;
            });
          } else {
            log('play');
            await controller.player.setReleaseMode(ReleaseMode.loop);
            await controller.player
                .play(
              AssetSource(controller.settingAmbientSound.value),
              mode: PlayerMode.mediaPlayer,
            )
                .then((_) {
              controller.isPlay.value = true;
            });
          }
        },
      ),
    );
  }
}
