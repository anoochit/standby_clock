import 'package:flutter/material.dart';
import 'package:standby_clock/widgets/ambient_sound_button.dart';

import 'package:standby_clock/widgets/simple_clock.dart';

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
            child: AmbientSoundButton(),
          ),
        ],
      ),
    );
  }
}
