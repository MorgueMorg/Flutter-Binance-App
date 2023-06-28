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
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                bloc: _cryptoListBloc,
                builder: (context, state) {
                  if (state is CryptoListLoaded) {
                    return Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: state.coinsList.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, i) {
                          final coin = state.coinsList[i];
                          return MarketsCoinTile(coin: coin);
                        },
                      ),
                    );
                  }
                  if (state is CryptoListLoadingFailure) {
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
                  }
                  return const Center(
                      child: CircularProgressIndicator(
                    color: secondaryDarkColor,
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
