import 'package:binance_clone/router/routes.dart';
import 'package:binance_clone/theme.dart';
import 'package:flutter/material.dart';

class BinanceApp extends StatelessWidget {
  const BinanceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Binance',
      theme: theme(),
      routerConfig: router,
    );
  }
}
