import 'package:binance_clone/binance_app.dart';
import 'package:binance_clone/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:binance_clone/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:binance_clone/repositories/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  runApp(const BinanceApp());
  // Инициализация hive
  await Hive.initFlutter();
  // Регистрация адаптера для hive
  Hive.registerAdapter(CryptoCoinAdapter());

  // Просто вынес бокс в отдельную переменную в виду бест практик
  const cryptoCoinsBoxName = 'crypto_coins_box';

  final cryptoCoinsBox = await Hive.openBox<CryptoCoin>(cryptoCoinsBoxName);
  // По сути GetIt вообще можно было не юзать в таком маленьком приложении, да и в чатах касательно flutter синьёры часто спорят о его надобности. Я решил добавить, просто от нечего делать
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
      () => CryptoCoinsRepository(cryptoCoinsBox: cryptoCoinsBox));
}
