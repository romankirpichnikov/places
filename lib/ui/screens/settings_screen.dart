import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/constants/domain/app_icons.dart';
import 'package:places/constants/domain/app_strings.dart';
import 'package:places/providers/theme_provider.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Theme.of(context).canvasColor,
        title: Text(
          AppStrings.settings,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.darkTheme,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                CupertinoSwitch(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) => themeProvider.toggleTheme(),
                ),
              ],
            ),
            const _SettingsDevider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.onboarding,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 32,
                    width: 32,
                    child: SvgPicture.asset(
                      AppIcons.information,
                    ),
                  ),
                ),
              ],
            ),
            const _SettingsDevider(),
          ],
        ),
      ),
    );
  }
}

class _SettingsDevider extends StatelessWidget {
  const _SettingsDevider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey,
    );
  }
}
