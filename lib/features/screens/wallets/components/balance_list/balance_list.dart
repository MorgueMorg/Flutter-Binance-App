import 'dart:async';

import 'package:binance_clone/components/constants.dart';
import 'package:binance_clone/components/size_config.dart';
import 'package:binance_clone/features/bloc/crypto_list_bloc/crypto_list_bloc.dart';
import 'package:binance_clone/features/screens/wallets/components/balance_list/upper_cart.dart';
import 'package:binance_clone/features/screens/wallets/components/balance_list/wallets_coin_tile.dart';
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
  bool isChecked = false;
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
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Balances",
                                style: TextStyle(
                                  fontSize: SizeConfig.screenWidth / 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.search),
                                color: Colors.grey.shade400,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: secondaryDarkColor,
                              checkColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => BorderSide(
                                    width: 0.5, color: Colors.grey.shade400),
                              ),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text(
                              "Hide 0 balances",
                              style: TextStyle(color: Colors.grey.shade400),
                            )
                          ],
                        )
                      ],
                    ),
                    BlocBuilder<CryptoListBloc, CryptoListState>(
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
                              return WalletsCoinTile(coin: coin);
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
                        return Column(
                          // ? Изначально тут был CircularProgressIndicator, но я захотел сделать так вот текст с небольшим пространством снизу.
                          children: [
                            Text(
                              "Loading...",
                              style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: getProportionateScreenHeight(15),
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            )
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
