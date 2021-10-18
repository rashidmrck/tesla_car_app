import 'package:flutter/material.dart';

import '../constanins.dart';

class BatteryStatus extends StatelessWidget {
  const BatteryStatus({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '200 mi',
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: Colors.white,
              ),
        ),
        const Text('62%', style: TextStyle(fontSize: 24)),
        const Spacer(),
        Text(
          'Charging'.toUpperCase(),
          style: const TextStyle(fontSize: 20),
        ),
        const Text(
          '18 min remaining',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.14,
        ),
        DefaultTextStyle(
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('22 min/hr'),
                Text('232 v'),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }
}
