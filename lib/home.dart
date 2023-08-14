import 'package:flutter/material.dart';
import 'package:analog_clock/clock.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        body: const Center(
          child: Clock(),
        ),
    );
  }
}