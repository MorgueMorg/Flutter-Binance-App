import 'package:binance_clone/repositories/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(coin.imageUrl),
      title: Text(
        coin.name,
        style: const TextStyle(color: Colors.red),
      ),
      subtitle: Text('${coin.priceInUSD} \$',
          style: const TextStyle(color: Colors.green)),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {},
    );
  }
}
