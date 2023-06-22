import 'package:binance_clone/features/screens/markets/components/search_field.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBarWidget(),
      ],
    );
  }
}
