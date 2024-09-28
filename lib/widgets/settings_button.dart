import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.settings,
        color: Theme.of(context).colorScheme.surfaceBright,
      ),
      onPressed: () {},
    );
  }
}
