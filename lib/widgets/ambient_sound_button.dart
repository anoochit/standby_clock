import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AmbientSoundButton extends StatefulWidget {
  const AmbientSoundButton({super.key});

  @override
  State<AmbientSoundButton> createState() => _AmbientSoundButtonState();
}

class _AmbientSoundButtonState extends State<AmbientSoundButton> {
  AudioPlayer player = AudioPlayer();
  bool isPlay = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        (isPlay) ? Icons.music_off : Icons.music_note,
        color: Theme.of(context).colorScheme.surfaceBright,
      ),
      onPressed: () async {
        if (isPlay) {
          log('stop');
          await player.stop().then((_) {
            setState(() {
              isPlay = false;
            });
          });
        } else {
          log('play');
          await player.setReleaseMode(ReleaseMode.loop);
          await player
              .play(
            AssetSource("sound/ocean.mp3"),
            mode: PlayerMode.mediaPlayer,
          )
              .then((_) {
            setState(() {
              isPlay = true;
            });
          });
        }
      },
    );
  }
}
