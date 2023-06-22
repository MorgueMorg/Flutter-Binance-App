import 'package:binance_clone/components/constants.dart';
import 'package:binance_clone/components/size_config.dart';
import 'package:binance_clone/features/screens/splash/components/body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Для инициализации адаптивки
    SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: primaryLightColor,
      body: Body(),
    );
  }
}
