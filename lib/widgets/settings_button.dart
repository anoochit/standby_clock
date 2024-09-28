import 'package:flutter/material.dart';

import '../pages/settings.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(
          Icons.settings,
        ),
        onPressed: () => buildSettingDialog(context));
  }

  buildSettingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: SettingPage(),
      ),
    );
  }
}
