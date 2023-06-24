import 'package:binance_clone/components/custom_tap_bar.dart';
import 'package:binance_clone/components/size_config.dart';
import 'package:binance_clone/features/screens/wallets/components/upper_cart.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTapBar(),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
        const UpperCart(),
      ],
    );
  }
}
