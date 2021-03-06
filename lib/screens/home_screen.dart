import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla_animated_app/components/battery_status.dart';
import 'package:tesla_animated_app/components/door_lock.dart';
import 'package:tesla_animated_app/components/tesla_bottom_nav_bar.dart';
import 'package:tesla_animated_app/constanins.dart';
import 'package:tesla_animated_app/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController _homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _homeController,
      builder: (context, snapshot) {
        return Scaffold(
          bottomNavigationBar: TeslaBottomNavigationBar(
            onTap: (value) {
              _homeController.changeSelectedTab(value);
            },
            selectedTab: _homeController.selectedTab,
          ),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 600),
                      opacity: _homeController.selectedTab == 1 ? 1 : 0,
                      child: SvgPicture.asset(
                        'assets/icons/Battery.svg',
                        width: constraints.maxWidth * 0.45,
                      ),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 600),
                      top: _homeController.selectedTab == 1 ? 0 : 75,
                      curve: const Interval(0.6, 1),
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 600),
                        curve: _homeController.selectedTab == 1
                            ? const Interval(0.6, 1)
                            : const Interval(0, 0),
                        opacity: _homeController.selectedTab == 1 ? 1 : 0,
                        child: BatteryStatus(
                          constraints: constraints,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: constraints.maxHeight * 0.1),
                      child: SvgPicture.asset(
                        'assets/icons/Car.svg',
                        width: double.infinity,
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      right: _homeController.selectedTab == 0
                          ? constraints.maxWidth * .05
                          : constraints.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _homeController.selectedTab == 0 ? 1 : 0,
                        child: DoorLock(
                          press: () => _homeController.changeRightLockStatus(),
                          isLock: _homeController.rightLockStatus,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      left: _homeController.selectedTab == 0
                          ? constraints.maxWidth * .05
                          : constraints.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _homeController.selectedTab == 0 ? 1 : 0,
                        child: DoorLock(
                          press: () => _homeController.changeLeftLockStatus(),
                          isLock: _homeController.leftLockStatus,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      bottom: _homeController.selectedTab == 0
                          ? constraints.maxHeight * .13
                          : constraints.maxHeight / 2,
                      duration: defaultDuration,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _homeController.selectedTab == 0 ? 1 : 0,
                        child: DoorLock(
                          press: () => _homeController.changeTopLockStatus(),
                          isLock: _homeController.topLockStatus,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      top: _homeController.selectedTab == 0
                          ? constraints.maxHeight * .13
                          : constraints.maxHeight / 2,
                      duration: defaultDuration,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _homeController.selectedTab == 0 ? 1 : 0,
                        child: DoorLock(
                          press: () => _homeController.changeBottomLockStatus(),
                          isLock: _homeController.bottomLockStatus,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
