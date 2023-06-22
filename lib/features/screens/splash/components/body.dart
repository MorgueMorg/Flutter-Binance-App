import 'package:binance_clone/components/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        // width: double.infinity,
        height: getProportionateScreenWidth(100),
        child: Image.asset("assets/icons/binance-logo.png"),
      ),
    );
  }
}
