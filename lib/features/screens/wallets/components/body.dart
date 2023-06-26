import 'package:binance_clone/components/custom_tap_bar.dart';
import 'package:binance_clone/components/size_config.dart';
import 'package:binance_clone/features/screens/wallets/components/balance_list/balance_list.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentIndex =
      1; // ? Для того чтобы на экране "wallets" индикатор был под текстом "spot".

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTapBar(
          currentIndex: currentIndex,
          onChangedTab: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
        const BalanceList(),
      ],
    );
  }
}
