import 'package:binance_clone/components/custom_tap_bar.dart';
import 'package:binance_clone/features/screens/markets/components/bottom_tapbar.dart';
import 'package:binance_clone/features/screens/markets/components/crypto_list.dart';
import 'package:binance_clone/features/screens/markets/components/search_field.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SearchBarWidget(),
          CustomTapBar(),
          BottomTapBar(),
          CryptoList(),
        ],
      ),
    );
  }
}
