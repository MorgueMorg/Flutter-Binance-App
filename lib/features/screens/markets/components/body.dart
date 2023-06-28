import 'package:binance_clone/components/custom_tap_bar.dart';
import 'package:binance_clone/features/screens/markets/components/crypto_list/crypto_list_screen.dart';
import 'package:binance_clone/features/screens/markets/components/widgets/search_field.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentIndex =
      0; // ? Для того чтобы на экране "markets" индикатор был под текстом "favorites".
  String searchText = ''; // ? Для поиска по криптовалюте

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBarWidget(
          onChanged: (value) {
            setState(() {
              searchText = value;
            });
          },
        ),
        CustomTapBar(
          currentIndex: currentIndex,
          onChangedTab: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        const SizedBox(height: 15),
        CryptoListScreen(searchText: searchText),
      ],
    );
  }
}
