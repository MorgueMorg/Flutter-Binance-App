import 'dart:async';

import 'package:binance_clone/components/constants.dart';
import 'package:binance_clone/components/size_config.dart';
import 'package:binance_clone/features/bloc/crypto_list_bloc/crypto_list_bloc.dart';
import 'package:binance_clone/features/screens/markets/components/crypto_list/markets_coin_tile.dart';
import 'package:binance_clone/features/screens/markets/components/widgets/bottom_tapbar.dart';
import 'package:binance_clone/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  final String searchText;

  const CryptoListScreen({Key? key, required this.searchText})
      : super(key: key);

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  late CryptoListBloc _cryptoListBloc;

  @override
  void initState() {
    super.initState();
    _cryptoListBloc = CryptoListBloc(
      GetIt.I<AbstractCoinsRepository>(),
    );
    _cryptoListBloc.add(LoadCryptoList());
  }

  @override
  void dispose() {
    _cryptoListBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CryptoListBloc>(
      create: (_) => _cryptoListBloc,
      child: Expanded(
        child: Container(
          decoration: const BoxDecoration(
            color: primaryLightColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: RefreshIndicator(
            color: secondaryDarkColor,
            onRefresh: () async {
              final completer = Completer();
              _cryptoListBloc.add(LoadCryptoList(completer: completer));
              return completer.future;
            },
            child: Column(
              children: [
                const BottomTapBar(),
                BlocBuilder<CryptoListBloc, CryptoListState>(
                  builder: (context, state) {
                    if (state is CryptoListLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                            color: secondaryDarkColor),
                      );
                    } else if (state is CryptoListLoaded) {
                      final filteredCoins = state.coinsList
                          .where((coin) =>
                              coin.name
                                  .toLowerCase()
                                  .contains(widget.searchText.toLowerCase()) ||
                              coin.toSymbol
                                  .toLowerCase()
                                  .contains(widget.searchText.toLowerCase()))
                          .toList();

                      return Expanded(
                        child: ListView.builder(
                          itemCount: filteredCoins.length,
                          itemBuilder: (context, index) {
                            final coin = filteredCoins[index];
                            return MarketsCoinTile(coin: coin);
                          },
                        ),
                      );
                    } else if (state is CryptoListLoadingFailure) {
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: getProportionateScreenHeight(50)),
                          const Text(
                            "Something went wrong",
                            style: TextStyle(color: Colors.white),
                          ),
                          const Text(
                            "Please try again later",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: getProportionateScreenHeight(40)),
                          TextButton(
                            onPressed: () {
                              _cryptoListBloc.add(LoadCryptoList());
                            },
                            child: const Text(
                              "Try again",
                              style: TextStyle(color: secondaryDarkColor),
                            ),
                          )
                        ],
                      ));
                    } else {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: secondaryDarkColor,
                      ));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
