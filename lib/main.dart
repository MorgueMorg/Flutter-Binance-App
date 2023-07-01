import 'package:binance_clone/binance_app.dart';
import 'package:binance_clone/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:binance_clone/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  runApp(const BinanceApp());
  // По сути GetIt вообще можно было не юзать в таком маленьком приложении, да и в чатах касательно flutter синьёры часто спорят о его надобности. Я решил добавить, просто от нечего делать
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
      () => CryptoCoinsRepository());
}
