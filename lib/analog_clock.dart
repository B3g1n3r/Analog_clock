import 'package:flutter/material.dart';
import 'dart:math';

class AnalogClock extends StatelessWidget {
  final int hour;
  final int minute;
  final int second;

  const AnalogClock({super.key, required this.hour, required this.minute, required this.second});

  @override
  Widget build(BuildContext context) {
    return
     Stack(
       alignment: Alignment.center,
       children: [
       Container(
         height: 270,
         width: 270,
         decoration: const BoxDecoration(
           shape: BoxShape.circle,
           color: Colors.blueGrey,
         ),
       ),
       Container(
         height: 230,
         width: 230,
         decoration: const BoxDecoration(
           shape: BoxShape.circle,
           color: Colors.black54
         ),
       ),
       ClockDesign(hour: hour, minute: minute, second: second)
     ],);
  }
}

class ClockDesign extends StatelessWidget {
  const ClockDesign({
    super.key,
    required this.hour,
    required this.minute,
    required this.second,
  });

  final int hour;
  final int minute;
  final int second;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      
      child:
       CustomPaint(
        painter: ClockPainter(
          hour: hour,
          minute: minute,
          second: second,
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final int hour;
  final int minute;
  final int second;

  ClockPainter({
    required this.hour,
    required this.minute,
    required this.second,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = size.width / 2;

    final hourAngle = (360 / 12) * (hour % 12 + minute / 60);
    final minuteAngle = (360 / 60) * minute;
    final secondAngle = (360 / 60) * second;

    final hourX = centerX + radius * 0.4 * cos((hourAngle - 90) * pi / 180);
    final hourY = centerY + radius * 0.4 * sin((hourAngle - 90) * pi / 180);

    final minuteX = centerX + radius * 0.6 * cos((minuteAngle - 90) * pi / 180);
    final minuteY = centerY + radius * 0.6 * sin((minuteAngle - 90) * pi / 180);

    final secondX = centerX + radius * 0.8 * cos((secondAngle - 90) * pi / 180);
    final secondY = centerY + radius * 0.8 * sin((secondAngle - 90) * pi / 180);

    final hourHandPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap=StrokeCap.round
      ..strokeWidth = 5;

    final minuteHandPaint = Paint()
      ..color = Colors.white70
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap=StrokeCap.round;

    final secondHandPaint = Paint()
      ..color = Colors.orange.withOpacity(1)
      ..style = PaintingStyle.stroke
      ..strokeCap=StrokeCap.round
      ..strokeWidth = 2;

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    const textStyle = TextStyle(color: Colors.white, fontSize: 17);

    for (int i = 1; i <= 12; i++) {
      final angle = (360 / 12) * i;
      final x = centerX + radius * 0.9 * cos((angle - 90) * pi / 180);
      final y = centerY + radius * 0.9 * sin((angle - 90) * pi / 180);

      final hourText = i == 12 ? '12' : '$i';

      textPainter.text = TextSpan(text: hourText, style: textStyle);
      textPainter.layout();

      final textX = x - textPainter.width / 2;
      final textY = y - textPainter.height / 2;

      textPainter.paint(canvas, Offset(textX, textY));
    }

    canvas.drawLine(
        Offset(centerX, centerY), Offset(hourX, hourY), hourHandPaint);
    canvas.drawLine(
        Offset(centerX, centerY), Offset(minuteX, minuteY), minuteHandPaint);
    canvas.drawLine(
        Offset(centerX, centerY), Offset(secondX, secondY), secondHandPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
