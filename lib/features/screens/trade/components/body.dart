import 'package:binance_clone/components/custom_tap_bar.dart';
import 'package:binance_clone/components/size_config.dart';
import 'package:binance_clone/features/screens/trade/components/trade.dart';
import 'package:flutter/material.dart';

// ! Страница trade была необязательна, я сделал ее просто для красоты! Снизу лапша код на 500 строк, все виджеты статические, так что не стоит обращать внимание на эту страницу!

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentIndex =
      2; // ? Для того чтобы на экране "trade" индикатор был под текстом "trade" на tapbar'e.

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTapBar(
            currentIndex: currentIndex,
            onChangedTab: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          const Trade(),
        ],
      ),
    );
  }
}
