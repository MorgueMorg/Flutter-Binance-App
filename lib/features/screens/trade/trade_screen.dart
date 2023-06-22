import 'package:binance_clone/components/constants.dart';
import 'package:binance_clone/components/custom_bottom_nav_bar.dart';
import 'package:binance_clone/components/menu_enums.dart';
import 'package:binance_clone/features/screens/trade/components/body.dart';
import 'package:flutter/material.dart';

class TradeScreen extends StatelessWidget {
  const TradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryLightColor,
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.trade,
      ),
    );
  }
}
