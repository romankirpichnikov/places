import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/constants/domain/app_icons.dart';
import 'package:places/constants/domain/app_strings.dart';
import 'package:places/ui/screens/filter_screen.dart';
import 'package:places/ui/screens/res/custom_color_scheme.dart';
import 'package:places/ui/widgets/buttons/flat_button.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomColors>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: customTheme?.searchBox,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset(
                  AppIcons.search,
                ),
              ),
            ),
            const Flexible(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: AppStrings.serach,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<FiltersScreen>(
                    builder: (context) => const FiltersScreen(),
                  ),
                );
              },
              icon: SvgPicture.asset(AppIcons.filter),
            ),
          ],
        ),
      ),
    );
  }
}
