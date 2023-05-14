import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/constants/domain/app_icons.dart';
import 'package:places/mocks/sights.dart';
import 'package:places/ui/screens/map_screen.dart';
import 'package:places/ui/screens/res/custom_color_scheme.dart';
import 'package:places/ui/screens/res/themes.dart';
import 'package:places/ui/screens/settings_screen.dart';
import 'package:places/ui/screens/sight_list_screen.dart';
import 'package:places/ui/screens/visiting_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.isDark ? AppTheme.dark : AppTheme.light,
      home: const TabScreen(),
    );
  }
}

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomColors>();

    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          SightListScreen(sights: SightsData.sights),
          const MapScreen(),
          VisitingScreen(sights: SightsData.sights),
          const SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabController.index,
        onTap: (index) {
          _tabController.animateTo(index);
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              AppIcons.list,
              color: customTheme?.buttonIcon,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              AppIcons.map,
              color: customTheme?.buttonIcon,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              AppIcons.heart,
              color: customTheme?.buttonIcon,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              AppIcons.settings,
              color: customTheme?.buttonIcon,
            ),
          ),
        ],
      ),
    );
  }
}
