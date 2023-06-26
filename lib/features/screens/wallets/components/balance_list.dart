import 'dart:async';

import 'package:binance_clone/components/constants.dart';
import 'package:binance_clone/components/size_config.dart';
import 'package:binance_clone/features/bloc/crypto_list_bloc/crypto_list_bloc.dart';
import 'package:binance_clone/features/screens/markets/components/crypto_list/crypto_coin_tile.dart';
import 'package:binance_clone/features/screens/wallets/components/upper_cart.dart';
import 'package:binance_clone/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class BalanceList extends StatefulWidget {
  const BalanceList({super.key});

  @override
  State<BalanceList> createState() => _BalanceListState();
}

class _BalanceListState extends State<BalanceList> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const UpperCart(),
            SizedBox(height: getProportionateScreenHeight(5)),
            Container(
              decoration: const BoxDecoration(
                color: primaryLightColor,
              ),
              child: RefreshIndicator(
                color: secondaryDarkColor,
                onRefresh: () async {
                  final completer = Completer();
                  _cryptoListBloc.add(LoadCryptoList(completer: completer));
                  return completer.future;
                },
                child: BlocBuilder<CryptoListBloc, CryptoListState>(
                  bloc: _cryptoListBloc,
                  builder: (context, state) {
                    if (state is CryptoListLoaded) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 16),
                        itemCount: state.coinsList.length,
                        itemBuilder: (context, index) {
                          final coin = state.coinsList[index];
                          return CryptoCoinTile(coin: coin);
                        },
                      );
                    }
                    if (state is CryptoListLoadingFailure) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Something went wrong"),
                            const Text("Please try again later"),
                            const SizedBox(height: 30),
                            TextButton(
                              onPressed: () {
                                _cryptoListBloc.add(LoadCryptoList());
                              },
                              child: const Text("Try again"),
                            ),
                          ],
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: secondaryDarkColor,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
