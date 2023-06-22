import 'package:binance_clone/components/custom_bottom_nav_bar.dart';
import 'package:binance_clone/components/menu_enums.dart';
import 'package:binance_clone/features/screens/wallets/components/body.dart';
import 'package:flutter/material.dart';

class WalletsScreen extends StatelessWidget {
  const WalletsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.wallets,
      ),
    );
  }
}
