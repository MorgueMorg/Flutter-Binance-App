import 'package:binance_clone/components/constants.dart';
import 'package:binance_clone/components/size_config.dart';
import 'package:flutter/material.dart';

class UpperCart extends StatelessWidget {
  const UpperCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(6.0, 8.0, 6.0, 8.0),
      decoration: const BoxDecoration(
        color: primaryLightColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye_rounded,
                        color: Colors.grey.shade400,
                        size: getProportionateScreenWidth(15),
                      ),
                      SizedBox(
                        width: getProportionateScreenHeight(5),
                      ),
                      const Text(
                        "Total Balance",
                        style: TextStyle(color: textLightColor),
                      ),
                      PopupMenuButton(
                        color: Colors.grey.shade400,
                        onSelected: (value) {
                          // your logic
                        },
                        itemBuilder: (BuildContext bc) {
                          return const [
                            PopupMenuItem(
                              child: Text("USDT"),
                            ),
                            PopupMenuItem(
                              child: Text("About"),
                            ),
                            PopupMenuItem(
                              child: Text("Contact"),
                            )
                          ];
                        },
                      )
                    ],
                  ),
                  Text(
                    "0",
                    style: TextStyle(
                        color: textLightColor,
                        fontSize: getProportionateScreenHeight(30)),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Text(
                    "= \$0,004095",
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                  SizedBox(height: getProportionateScreenHeight(15)),
                  Row(
                    children: [
                      Text(
                        "Today's PNL",
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                      SizedBox(
                        width: getProportionateScreenHeight(5),
                      ),
                      Icon(
                        Icons.info,
                        color: Colors.grey.shade400,
                        size: getProportionateScreenWidth(15),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Row(
                    children: [
                      Text(
                        "+\$0,00000+1,50%",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(15),
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenHeight(5),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey.shade400,
                        size: getProportionateScreenWidth(15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  Container(
                    height: getProportionateScreenHeight(35),
                    width: getProportionateScreenHeight(125),
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Center(
                      child: Text("Deposit"),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
