import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:cronodoro/model/custom_animated_bottom_bar.dart';
import 'package:cronodoro/pages/dashboard/dashboard_controller.dart';
import 'package:cronodoro/pages/home/home_page.dart';
import 'package:cronodoro/pages/internal_storage/timer_page.dart';
import 'package:cronodoro/pages/settings/settings_page.dart';

import '../../shared/app_colors.dart';

class MyDashBoard extends GetView<DashboardController> {
  MyDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: GetBuilder<DashboardController>(
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: [
                  HomePage(),
                  Navigator(
                    key: controller.navigatorKey,
                    onGenerateRoute: (routeSettings) {
                      return MaterialPageRoute(
                        builder: (context) => TimerPage(),
                      );
                    },
                  ),
                  SettingsPage(),
                ],
              ),
            ),
            bottomNavigationBar: CustomAnimatedBottomBar(
              containerHeight: 70,
              backgroundColor: Colors.white,
              selectedIndex: controller.tabIndex,
              showElevation: true,
              itemCornerRadius: 30,
              curve: Curves.easeIn,
              onItemSelected: controller.changeTabIndex,
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                  icon: Icon(Icons.people),
                  title: Text('Perfil'),
                  activeColor: AppColors.primary,
                  inactiveColor: controller.inActiveColor,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: SvgPicture.asset("assets/img/logo.svg", height: 25),
                  title: Text('Timer'),
                  activeColor: AppColors.primary,
                  inactiveColor: controller.inActiveColor,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.history),
                  title: Text('Historico'),
                  activeColor: AppColors.primary,
                  inactiveColor: controller.inActiveColor,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
