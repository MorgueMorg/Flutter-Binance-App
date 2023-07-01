import 'package:binance_clone/components/size_config.dart';
import 'package:binance_clone/repositories/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WalletsCoinTile extends StatelessWidget {
  const WalletsCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        coin.imageUrl,
        height: getProportionateScreenHeight(30),
      ),
      title: Text(
        coin.name,
        style: TextStyle(
          fontSize: SizeConfig.screenWidth / 20.0,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        coin.lastMarket,
        style: TextStyle(
          fontSize: SizeConfig.screenWidth / 28.0,
          color: Colors.grey.shade400,
        ),
      ),
      trailing: Text(
        "${coin.priceInUSD}",
        style: TextStyle(
          fontSize: SizeConfig.screenWidth / 25.0,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        GoRouter.of(context).go('/details', extra: coin);
      },
    );
  }
}
