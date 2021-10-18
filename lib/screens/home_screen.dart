import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                      top: _homeController.selectedTab == 0
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
                      bottom: _homeController.selectedTab == 0
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
