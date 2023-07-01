import 'package:binance_clone/components/constants.dart';
import 'package:binance_clone/components/size_config.dart';
import 'package:binance_clone/repositories/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MarketsCoinTile extends StatelessWidget {
  const MarketsCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).go('/details', extra: coin);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(6.0, 8.0, 6.0, 8.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: coin.name,
                            style: TextStyle(
                              fontSize: SizeConfig.screenWidth / 26.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' /${coin.toSymbol}',
                            style: TextStyle(
                              fontSize: SizeConfig.screenWidth / 28.0,
                              color: Colors.grey.shade200,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 2.5,
                    ),
                    Text(
                      "Vol ${coin.lastVolumeTo}".substring(0, 9),
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth / 28.0,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${coin.high24Hours}'.length > 8
                          ? '${coin.priceInUSD}'.substring(0, 5)
                          : '${coin.priceInUSD}',
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth / 25.0,
                        color: greenLightColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    Text(
                      '\$${coin.high24Hours}'.length > 8
                          ? '\$${coin.priceInUSD}'.substring(0, 5)
                          : '\$${coin.priceInUSD}',
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth / 30.0,
                        // color: Colors.grey.shade300,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 16.0, 12.0),
                  decoration: BoxDecoration(
                    // color: const Color(0xFF00FF80).withOpacity(.15),
                    color: greenLightColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Center(
                    child: Text(
                      // ! Просто для красоты и валидации
                      "${"+${coin.high24Hours}".substring(0, 2)},${"${coin.high24Hours}".substring(1, 3).replaceAll(".", "")}",
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth / 23.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
