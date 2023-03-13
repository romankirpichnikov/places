import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/screens/visiting_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: SvgPicture.asset(AppIcons.list),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: SvgPicture.asset(AppIcons.map),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: SvgPicture.asset(AppIcons.favorite),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: SvgPicture.asset(AppIcons.settings),
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (_currentIndex == AppTab.home.index) {
      Navigator.popUntil(context, (route) => route.isFirst);
    } else if (_currentIndex == AppTab.favorite.index) {
      Navigator.push(
        context,
        MaterialPageRoute<VisitingScreen>(
          builder: (context) => const VisitingScreen(),
        ),
      );
    }
  }
}

enum AppTab {
  home,
  map,
  favorite,
  settings,
}

class AppIcons {
  static const String list = 'res/icons/list.svg';
  static const String map = 'res/icons/map.svg';
  static const String favorite = 'res/icons/favorite.svg';
  static const String settings = 'res/icons/settings.svg';
}
