import 'package:binance_clone/components/constants.dart';
import 'package:binance_clone/components/size_config.dart';
import 'package:binance_clone/features/screens/splash/components/body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMarketsScreen();
  }

  _navigateToMarketsScreen() async {
    // Future.delayed для задержки. После сплэша нас перекидывает на экран markets
    await Future.delayed(const Duration(milliseconds: 1500), () {
      context.go('/markets');
    });
  }

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
