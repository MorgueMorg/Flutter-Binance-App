import 'package:binance_clone/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:binance_clone/repositories/models/crypto_coin.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
        // ! Апишка с которой я стягиваю крипту
        "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID,CAG,DOV,EXE,DOGE,LTC,PEPE&tsyms=USD");
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
