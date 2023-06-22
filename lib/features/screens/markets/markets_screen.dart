import 'package:binance_clone/components/constants.dart';
import 'package:binance_clone/components/custom_bottom_nav_bar.dart';
import 'package:binance_clone/components/menu_enums.dart';
import 'package:binance_clone/components/size_config.dart';
import 'package:binance_clone/features/screens/markets/components/body.dart';
import 'package:flutter/material.dart';

class MarketsScreen extends StatelessWidget {
  const MarketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDarkColor,
      appBar: AppBar(
        backgroundColor: primaryDarkColor,
        toolbarHeight: getProportionateScreenHeight(20),
        centerTitle: true,
        iconTheme: const IconThemeData(color: primaryLightColor),
        automaticallyImplyLeading: false,
      ),
      body: const Body(),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.markets,
      ),
    );
  }
}
