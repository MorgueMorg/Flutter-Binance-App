import 'package:binance_clone/components/size_config.dart';
import 'package:binance_clone/repositories/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${coin.priceInUSD} \$'.substring(0, 5),
                    style: TextStyle(
                      fontSize: SizeConfig.screenWidth / 28.0,
                      color: Colors.grey.shade300,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16.0, 12.0, 8.0, 12.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00FF80).withOpacity(.15),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      // ! Просто для красота и валидации
                      "+${coin.high24Hours}".substring(0, 5),
                      // '+3.33%',
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth / 30.0,
                        color: const Color(0xFF00FF80),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
