
import 'package:flutter/material.dart';

import 'clock.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClockText(),
            Clock(),
          ],
        ),
      ),
    ),
  ));
}

class ClockText extends StatefulWidget {
  @override
  _ClockTextState createState() => _ClockTextState();
}

class _ClockTextState extends State<ClockText> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int hours = now.hour;
    int minutes = now.minute;
    int seconds = now.second;

    setState(() {
       hours = now.hour;
       minutes = now.minute;
       seconds = now.second;
    });
    return Text("$hours :$minutes :$seconds");
  }
}
