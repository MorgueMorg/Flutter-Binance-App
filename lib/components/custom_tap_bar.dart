import 'package:binance_clone/components/constants.dart';
import 'package:binance_clone/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomTapBar extends StatefulWidget {
  const CustomTapBar({super.key});

  @override
  State<CustomTapBar> createState() => CustomTapBarState();
}

class CustomTapBarState extends State<CustomTapBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 5,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (index) {
        if (index == 0) {
          context.go('/markets');
        } else if (index == 1) {
          context.go("/wallets");
        }
      },
      isScrollable: true,
      controller: tabController,
      labelColor: textLightColor,
      indicatorColor: const Color(0xFFFFD500),
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 1.75,
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 28.0),
      // indicatorPadding:
      //     EdgeInsets.symmetric(horizontal: 28.0 - (selectedTabIndex * 28.0)),
      labelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: SizeConfig.screenWidth / 28.0,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: SizeConfig.screenWidth / 28.0,
      ),
      tabs: [
        SizedBox(
          width: SizeConfig.screenWidth * .2,
          child: const Tab(
            text: 'Favorites',
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth * .15,
          child: const Tab(
            text: 'Spot',
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth * .15,
          child: const Tab(
            text: 'Futures',
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth * .15,
          child: const Tab(
            text: 'Feed',
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth * .15,
          child: const Tab(
            text: 'Data',
          ),
        ),
      ],
    );
  }
}
