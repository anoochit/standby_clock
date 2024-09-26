import 'package:flip_board/flip_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SimpleClock extends StatelessWidget {
  const SimpleClock({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Flex(
          direction: orientation == Orientation.portrait
              ? Axis.vertical
              : Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTimeUnit(context, orientation, TimeUnit.hour),
            _buildSeparator(context, orientation),
            _buildTimeUnit(context, orientation, TimeUnit.minute),
            _buildSeparator(context, orientation),
            _buildTimeUnit(context, orientation, TimeUnit.second),
          ],
        );
      },
    );
  }

  Widget _buildTimeUnit(
      BuildContext context, Orientation orientation, TimeUnit unit) {
    return FlipWidget(
      flipType: FlipType.middleFlip,
      itemStream:
          Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now())
              .map(unit.getValue),
      hingeWidth: 1.0,
      hingeLength: 10.0,
      itemBuilder: (context, _) {
        final value = unit.format(DateTime.now());
        return _buildTimeCard(context, value);
      },
      flipDirection: AxisDirection.down,
    );
  }

  Widget _buildTimeCard(BuildContext context, String value) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          value,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .apply(fontSizeFactor: 2.0),
        ),
      ),
    );
  }

  Widget _buildSeparator(BuildContext context, Orientation orientation) {
    return Visibility(
      visible: orientation == Orientation.landscape,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          ':',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .apply(fontSizeFactor: 2.0),
        ),
      ),
    );
  }
}

enum TimeUnit {
  hour,
  minute,
  second;

  String format(DateTime time) {
    switch (this) {
      case TimeUnit.hour:
        return DateFormat('HH').format(time);
      case TimeUnit.minute:
        return DateFormat('mm').format(time);
      case TimeUnit.second:
        return DateFormat('ss').format(time);
    }
  }

  int getValue(DateTime time) {
    switch (this) {
      case TimeUnit.hour:
        return time.hour;
      case TimeUnit.minute:
        return time.minute;
      case TimeUnit.second:
        return time.second;
    }
  }
}
