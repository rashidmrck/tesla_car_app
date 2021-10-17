import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla_animated_app/components/door_lock.dart';
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
            onTap: (value) {},
            selectedTab: 0,
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
                    Positioned(
                      right: constraints.maxWidth * .05,
                      child: DoorLock(
                        press: () => _homeController.changeRightLockStatus(),
                        isLock: _homeController.rightLockStatus,
                      ),
                    ),
                    Positioned(
                      left: constraints.maxWidth * .05,
                      child: DoorLock(
                        press: () => _homeController.changeLeftLockStatus(),
                        isLock: _homeController.leftLockStatus,
                      ),
                    ),
                    Positioned(
                      top: constraints.maxHeight * .13,
                      child: DoorLock(
                        press: () => _homeController.changeTopLockStatus(),
                        isLock: _homeController.topLockStatus,
                      ),
                    ),
                    Positioned(
                      bottom: constraints.maxHeight * .13,
                      child: DoorLock(
                        press: () => _homeController.changeBottomLockStatus(),
                        isLock: _homeController.bottomLockStatus,
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

class TeslaBottomNavigationBar extends StatelessWidget {
  const TeslaBottomNavigationBar({
    Key? key,
    required this.onTap,
    required this.selectedTab,
  }) : super(key: key);

  final ValueChanged<int?> onTap;
  final int selectedTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: selectedTab,
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      items: List.generate(
        iconImage.length,
        (index) => BottomNavigationBarItem(
          icon: SvgPicture.asset(
            iconImage[index],
            color: selectedTab == index ? primaryColor : Colors.white54,
          ),
          label: '',
        ),
      ),
    );
  }
}

List<String> iconImage = [
  'assets/icons/Lock.svg',
  'assets/icons/Charge.svg',
  'assets/icons/Temp.svg',
  'assets/icons/Tyre.svg',
];
