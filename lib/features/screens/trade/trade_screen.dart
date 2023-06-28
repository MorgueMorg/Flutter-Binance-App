import 'package:binance_clone/components/constants.dart';
import 'package:binance_clone/components/custom_bottom_nav_bar.dart';
import 'package:binance_clone/components/menu_enums.dart';
import 'package:binance_clone/components/size_config.dart';
import 'package:binance_clone/features/screens/trade/components/body.dart';
import 'package:flutter/material.dart';

class TradeScreen extends StatelessWidget {
  const TradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryLightColor,
        toolbarHeight: getProportionateScreenHeight(20),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: primaryLightColor,
      body: const Body(),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.trade,
      ),
    );
  }
}
