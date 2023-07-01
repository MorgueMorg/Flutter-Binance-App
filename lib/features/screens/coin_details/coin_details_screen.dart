import 'package:binance_clone/components/constants.dart';
import 'package:binance_clone/features/screens/coin_details/components/base_card.dart';
import 'package:binance_clone/repositories/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ! Просто по приколу этот экран добавил

class CoinDetailsScreen extends StatelessWidget {
  final CryptoCoin coin;

  const CoinDetailsScreen({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLightColor,
      appBar: AppBar(
        backgroundColor: primaryLightColor,
        title: Text(coin.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            GoRouter.of(context).go('/markets');
          },
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 160,
              width: 160,
              child: Image.network(coin.imageUrl),
            ),
            const SizedBox(height: 24),
            Text(
              coin.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            BaseCard(
              child: Center(
                child: Text(
                  '${coin.priceInUSD} \$',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            BaseCard(
              child: Column(
                children: [
                  _DataRow(
                    title: 'Hight 24 Hour',
                    value: '${coin.high24Hours} \$',
                  ),
                  const SizedBox(height: 6),
                  _DataRow(
                    title: 'Low 24 Hour',
                    value: '${coin.lastVolumeTo} \$',
                  ),
                  const SizedBox(height: 6),
                  _DataRow(
                    title: 'Last Market',
                    value: '${coin.lastMarket} ',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: 140,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
              ),
            )),
        const SizedBox(width: 32),
        Flexible(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
