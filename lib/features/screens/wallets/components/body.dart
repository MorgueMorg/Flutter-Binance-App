import 'package:binance_clone/components/custom_tap_bar.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTapBar(),
      ],
    );
  }
}
