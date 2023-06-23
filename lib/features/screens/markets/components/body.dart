import 'package:binance_clone/components/custom_tap_bar.dart';
import 'package:binance_clone/features/screens/markets/components/crypto_list/crypto_list_screen.dart';
import 'package:binance_clone/features/screens/markets/components/widgets/bottom_tapbar.dart';
import 'package:binance_clone/features/screens/markets/components/widgets/search_field.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SearchBarWidget(),
        CustomTapBar(),
        BottomTapBar(),
        CryptoListScreen(),
      ],
    );
  }
}
