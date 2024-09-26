import 'package:flutter/material.dart';

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
            child: AmbientSoundButton(),
          ),
        ],
      ),
    );
  }
}
