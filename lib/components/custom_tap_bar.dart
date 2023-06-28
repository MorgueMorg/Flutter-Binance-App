import 'package:binance_clone/components/constants.dart';
import 'package:binance_clone/components/size_config.dart';
import 'package:binance_clone/router/routes.dart';
import 'package:flutter/material.dart';

class CustomTapBar extends StatefulWidget {
  final int currentIndex;
  final void Function(int index) onChangedTab;

  const CustomTapBar({
    Key? key,
    required this.currentIndex,
    required this.onChangedTab,
  }) : super(key: key);

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
      initialIndex: widget.currentIndex,
      vsync: this,
    );
    tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    tabController.removeListener(_handleTabSelection);
    tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    if (!tabController.indexIsChanging) {
      // Изменение индекса для навигации по tapbar'у
      widget.onChangedTab(tabController.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (index) {
        tabController.animateTo(index);
        // ! Для навигации по tapbar'у
        if (index == 0) {
          router.go('/markets');
        } else if (index == 1) {
          router.go('/wallets');
        } else if (index == 2) {
          router.go('/trade');
        }
      },
      isScrollable: true,
      controller: tabController,
      labelColor: textLightColor,
      indicatorColor: secondaryDarkColor,
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 2.5,
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 28.0),
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
            text: 'Trade',
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
