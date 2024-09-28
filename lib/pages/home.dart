import 'package:flutter/material.dart';
import 'package:standby_clock/widgets/settings_button.dart';

import '../widgets/ambient_sound_button.dart';
import '../widgets/simple_clock.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Center(
            child: SimpleClock(),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SettingsButton(),
                  AmbientSoundButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
