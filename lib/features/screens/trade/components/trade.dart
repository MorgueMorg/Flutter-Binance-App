import 'package:binance_clone/components/constants.dart';
import 'package:binance_clone/components/size_config.dart';
import 'package:flutter/material.dart';

// ! Страница trade была необязательна, я сделал ее просто для красоты! Снизу лапша код на 500 строк, все виджеты статические, так что не стоит обращать внимание на эту страницу! 

class Trade extends StatefulWidget {
  const Trade({super.key});

  @override
  State<Trade> createState() => _TradeState();
}

class _TradeState extends State<Trade> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryLightColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(context),
            _buildValueOfTopBar(context),
            Container(
              height: getProportionateScreenHeight(2),
              color: primaryDarkColor,
            ),
            Container(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(10),
                right: getProportionateScreenWidth(20),
                bottom: getProportionateScreenHeight(30),
                top: getProportionateScreenHeight(30),
              ),
              child: Row(
                children: [
                  _buildLeftColumn(context),
                  SizedBox(width: getProportionateScreenWidth(20)),
                  _buildRightColumn(context),
                ],
              ),
            ),
            Container(
              height: getProportionateScreenHeight(2),
              color: primaryDarkColor,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * .4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
                    child: Text(
                      'Active Orders',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade700,
                    thickness: .35,
                    height: .35,
                  ),
                  Expanded(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // padding: EdgeInsets.only(top: 4.0),
                          Text(
                            'No order...',
                            style: TextStyle(
                              color: Colors.grey.shade200,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
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

  Widget _buildTopBar(context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 6.0, 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              'Strike Price',
              style: TextStyle(
                fontSize: SizeConfig.screenWidth / 30.0,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Spot Price',
                  style: TextStyle(
                    fontSize: SizeConfig.screenWidth / 30.0,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Before Enpiry',
                  style: TextStyle(
                    fontSize: SizeConfig.screenWidth / 30.0,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValueOfTopBar(context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 2.0, 6.0, 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              '750.04',
              style: TextStyle(
                fontSize: SizeConfig.screenWidth / 26.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '1112.24',
                  style: TextStyle(
                    fontSize: SizeConfig.screenWidth / 26.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '1 Day',
                  style: TextStyle(
                    fontSize: SizeConfig.screenWidth / 26.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftColumn(context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildAction(context, 'Buy', true),
            _buildAction(context, 'Sell', false),
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(6.0, 8.0, 4.0, 8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade600,
              width: .5,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Custom',
                style: TextStyle(
                  fontSize: SizeConfig.screenWidth / 32.0,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(12),
        ),
        _buildCustomValue(context),
        SizedBox(
          height: getProportionateScreenHeight(12),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Available',
                style: TextStyle(
                  fontSize: SizeConfig.screenWidth / 32.0,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                '0.00USDT',
                style: TextStyle(
                  fontSize: SizeConfig.screenWidth / 32.0,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(12)),
        _buildCustomValue(context),
        SizedBox(height: getProportionateScreenHeight(12)),
        Row(
          children: [
            _buildPercentCard(context, '25%'),
            SizedBox(width: getProportionateScreenWidth(4)),
            _buildPercentCard(context, '50%'),
            SizedBox(width: getProportionateScreenWidth(4)),
            _buildPercentCard(context, '75%'),
            SizedBox(width: getProportionateScreenWidth(4)),
            _buildPercentCard(context, '100%'),
          ],
        ),
        SizedBox(height: getProportionateScreenHeight(12)),
        Container(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenHeight(12)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: greenLightColor,
          ),
          alignment: Alignment.center,
          child: Text(
            // _action,
            "Buy",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: SizeConfig.screenWidth / 24.0,
            ),
          ),
        ),
      ],
    ));
  }

  Widget _buildAction(context, title, left) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            // _action = title;
          });
        },
        child: Container(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenHeight(12)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(
                left ? 2.5 : .0,
              ),
              right: Radius.circular(
                left ? .0 : 2.5,
              ),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontSize: SizeConfig.screenWidth / 28.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomValue(context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              // setState(() {
              //   _valueCustom -= .1;
              // });
            },
            child: Container(
                height: 36.0,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(
                      6.0,
                    ),
                  ),
                  border: Border.all(
                    color: Colors.white24,
                    width: .4,
                  ),
                ),
                child: Center(
                  child: Text(
                    "-",
                    style: TextStyle(
                      color: Colors.grey.shade200,
                      fontSize: SizeConfig.screenWidth / 20.0,
                    ),
                  ),
                )),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 36.0,
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Colors.grey.shade400,
                  width: .25,
                ),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              "9.9902",
              // '${_valueCustom.toStringAsFixed(4)}',
              style: TextStyle(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w300,
                fontSize: SizeConfig.screenWidth / 30.0,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              setState(() {
                // _valueCustom += .1;
              });
            },
            child: Container(
              height: 36.0,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(
                    6.0,
                  ),
                ),
                border: Border.all(
                  color: Colors.white24,
                  width: .4,
                ),
              ),
              child: Center(
                child: Text(
                  "+",
                  style: TextStyle(
                    color: Colors.grey.shade200,
                    fontSize: SizeConfig.screenWidth / 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPercentCard(context, title) {
    return Expanded(
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(8)),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white38,
            width: .4,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white70,
            fontSize: SizeConfig.screenWidth / 40.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }

  Widget _buildRightColumn(context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price',
                  style: TextStyle(
                    fontSize: SizeConfig.screenWidth / 28.8,
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Amount',
                  style: TextStyle(
                    fontSize: SizeConfig.screenWidth / 28.8,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          _buildValuePriceLine(
              context, '10.1682', '312', const Color(0xFFFF3232)),
          _buildValuePriceLine(
              context, '9.4289', '1112', const Color(0xFFFF3232)),
          _buildValuePriceLine(
              context, '3.3152', '122', const Color(0xFFFF3232)),
          _buildValuePriceLine(
              context, '7.1482', '512', const Color(0xFFFF3232)),
          _buildValuePriceLine(
              context, '11.282', '212', const Color(0xFFFF3232)),
          Container(
            padding: EdgeInsets.only(
                bottom: getProportionateScreenHeight(16),
                top: getProportionateScreenHeight(20)),
            alignment: Alignment.center,
            child: Text(
              '9.5129 ≈ \$9.51',
              style: TextStyle(
                fontSize: SizeConfig.screenWidth / 28.5,
                color: Colors.grey.shade100,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          _buildValuePriceLine(context, '10.1682', '312', greenLightColor),
          _buildValuePriceLine(context, '9.4289', '1112', greenLightColor),
          _buildValuePriceLine(context, '3.3152', '122', greenLightColor),
          _buildValuePriceLine(context, '7.1482', '512', greenLightColor),
          _buildValuePriceLine(context, '11.282', '212', greenLightColor),
        ],
      ),
    );
  }

  Widget _buildValuePriceLine(context, price, amount, color) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            price,
            style: TextStyle(
              fontSize: SizeConfig.screenWidth / 30.0,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: SizeConfig.screenWidth / 30.0,
              color: Colors.grey.shade200,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
