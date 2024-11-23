import 'package:flutter/material.dart';

import 'package:flip_board/flip_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/app_controller.dart';

class SimpleClock extends GetView<AppController> {
  const SimpleClock({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OrientationBuilder(
        builder: (context, orientation) {
          return Obx(
            () => Flex(
              direction: (orientation == Orientation.portrait)
                  ? Axis.vertical
                  : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // hour
                FlipWidget(
                  flipType: FlipType.middleFlip,
                  itemStream: Stream.periodic(
                    const Duration(seconds: 1),
                    (_) => DateTime.now().hour,
                  ),
                  hingeWidth: 2.0,
                  hingeLength: 10.0,
                  itemBuilder: (buildContext, item) {
                    final value = DateFormat('HH').format(DateTime.now());
                    return Card(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          value,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .apply(fontSizeFactor: 2.8),
                        ),
                      ),
                    );
                  },
                  flipDirection: AxisDirection.down,
                ),

                buildSeparater(context, orientation),

                // minute
                FlipWidget(
                  flipType: FlipType.middleFlip,
                  itemStream: Stream.periodic(
                    const Duration(seconds: 1),
                    (_) => DateTime.now().minute,
                  ),
                  hingeWidth: 2.0,
                  hingeLength: 10.0,
                  itemBuilder: (buildContext, item) {
                    final value = DateFormat('mm').format(DateTime.now());
                    return Card(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          value,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .apply(fontSizeFactor: 2.8),
                        ),
                      ),
                    );
                  },
                  flipDirection: AxisDirection.down,
                ),

                (controller.settingShowSecond.value)
                    ? buildSeparater(context, orientation)
                    : const SizedBox(),

                // sec
                (controller.settingShowSecond.value)
                    ? FlipWidget(
                        flipType: FlipType.middleFlip,
                        itemStream: Stream.periodic(
                          const Duration(seconds: 1),
                          (_) => DateTime.now().second,
                        ),
                        hingeWidth: 2.0,
                        hingeLength: 10.0,
                        itemBuilder: (buildContext, item) {
                          final value = DateFormat('ss').format(DateTime.now());
                          return Card(
                            color:
                                Theme.of(context).colorScheme.surfaceContainer,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                value,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .apply(fontSizeFactor: 2.8),
                              ),
                            ),
                          );
                        },
                        flipDirection: AxisDirection.down,
                      )
                    : const SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildSeparater(BuildContext context, Orientation orientation) {
    return Visibility(
      visible: (orientation == Orientation.landscape),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          ':',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .apply(fontSizeFactor: 2.6),
        ),
      ),
    );
  }
}
