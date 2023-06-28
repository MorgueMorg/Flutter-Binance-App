import 'package:binance_clone/binance_app.dart';
import 'package:binance_clone/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:binance_clone/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  runApp(const BinanceApp());
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
      () => CryptoCoinsRepository());
}
