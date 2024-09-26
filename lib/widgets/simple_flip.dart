import 'package:flutter/material.dart';

import 'package:flip_board/flip_clock.dart';

class SimpleFlip extends StatefulWidget {
  const SimpleFlip({super.key});

  @override
  State<SimpleFlip> createState() => _SimpleFlipState();
}

class _SimpleFlipState extends State<SimpleFlip> {
  @override
  Widget build(BuildContext context) {
    return FlipClock(
      digitSize: 60,
      width: MediaQuery.sizeOf(context).width / 8,
      height: MediaQuery.sizeOf(context).width / 4,
      separatorWidth: 0.0,
      flipDirection: AxisDirection.down,
    );
  }
}
