import 'package:flutter/cupertino.dart';

import 'analog_clock.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DateTime now = snapshot.data!;
          return AnalogClock(
            hour: now.hour,
            minute: now.minute,
            second: now.second,
          );
        } else {
          return const Text('Loading...');
        }
      },
    );
  }
}
