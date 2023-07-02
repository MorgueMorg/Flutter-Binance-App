import 'package:binance_clone/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:binance_clone/repositories/models/crypto_coin.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  final Box<CryptoCoin> cryptoCoinsBox;

  CryptoCoinsRepository({required this.cryptoCoinsBox});

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    var cryptoCoinsList = <CryptoCoin>[];
    try {
      cryptoCoinsList = await _fetchCoinsList();
      // Перевожу в мапу (Словарь) циклом, где у каждого ключа (e.name) будет значение e
      final cryptoCoinsMap = {for (var e in cryptoCoinsList) e.name: e};
      // Метод putAll(Hive method), пихаю лист крипты в хэш(чтобы доставать на локалке без подключения к интернету)
      await cryptoCoinsBox.putAll(cryptoCoinsMap);
    } catch (e) {
      cryptoCoinsList = cryptoCoinsBox.values.toList();
    }
    return cryptoCoinsList;
  }

  Future<List<CryptoCoin>> _fetchCoinsList() async {
    // Не стал создавать глобальную переменную dio, потому что юзаю ее всего раз
    final response = await Dio().get(
        // ! Апишка с которой я стягиваю крипту
        "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID,CAG,DOV,EXE,DOGE,LTC,PEPE,SMC,XCE,EDC,XGR&tsyms=USD");
    // ? Ниже сериализирию
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final toSymbol = usdData["TOSYMBOL"];
      final high24Hours = usdData['HIGH24HOUR'];
      final imageUrl = usdData["IMAGEURL"];
      final lastVolumeTo = usdData["LASTVOLUMETO"];
      final lastMarket = usdData["LASTMARKET"];
      return CryptoCoin(
        name: e.key,
        priceInUSD: price,
        toSymbol: toSymbol,
        high24Hours: high24Hours,
        lastVolumeTo: lastVolumeTo,
        imageUrl: 'https://www.cryptocompare.com/$imageUrl',
        lastMarket: lastMarket,
      );
    }).toList();
    return cryptoCoinsList;
  }
}
