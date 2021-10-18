import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constanins.dart';

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
