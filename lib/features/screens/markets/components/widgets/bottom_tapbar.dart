import 'package:binance_clone/components/size_config.dart';
import 'package:flutter/material.dart';

class BottomTapBar extends StatelessWidget {
  const BottomTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: getProportionateScreenHeight(28),
                width: getProportionateScreenWidth(50),
                color: const Color.fromARGB(255, 48, 55, 70),
                child: const Center(
                  child: Text(
                    "Spot",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    // color: Color.fromARGB(255, 48, 55, 70),
                    color: Colors.grey.shade500,
                    size: getProportionateScreenHeight(20),
                  ))
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Name / Vol',
                  style: TextStyle(
                    fontSize: SizeConfig.screenWidth / 26.0,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Last Price',
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth / 30.0,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_double_arrow_up_sharp,
                      color: Colors.grey.shade400,
                      size: SizeConfig.screenWidth / 26.0,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '24h Change',
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth / 30.0,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_double_arrow_down_sharp,
                      color: Colors.grey.shade400,
                      size: SizeConfig.screenWidth / 26.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
