import 'package:hive_flutter/hive_flutter.dart';

// Решил сгенерировать модельку для hive
part 'crypto_coin.g.dart';

@HiveType(typeId: 1)
class CryptoCoin {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String imageUrl;
  @HiveField(2)
  final String toSymbol;
  @HiveField(3)
  final String lastMarket;
  @HiveField(4)
  final double priceInUSD;
  @HiveField(5)
  final double high24Hours;
  @HiveField(6)
  final double lastVolumeTo;

  CryptoCoin(
      {required this.name,
      required this.imageUrl,
      required this.toSymbol,
      required this.lastMarket,
      required this.priceInUSD,
      required this.high24Hours,
      required this.lastVolumeTo});
}
