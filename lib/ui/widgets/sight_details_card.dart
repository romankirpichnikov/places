import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/constants/domain/app_icons.dart';
import 'package:places/constants/domain/app_strings.dart';
import 'package:places/constants/domain/app_text_styles.dart';
import 'package:places/constants/domain/sight_types.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screens/res/custom_color_scheme.dart';
import 'package:places/ui/widgets/buttons/flat_button.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';
import 'package:places/utils/loading_builder.dart';

class SightDetailsCard extends StatelessWidget {
  final Sight sight;
  const SightDetailsCard({
    super.key,
    required this.sight,
  });

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomColors>();

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 360,
                  width: double.infinity,
                  child: Image.network(
                    sight.url,
                    fit: BoxFit.cover,
                    loadingBuilder: loadingBuilder,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    sight.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Text(
                        sight.type.name,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        sight.workingHours,
                        style: AppTextStyles.disabledTextSmall,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24.0, left: 8.0),
                  child: Text(
                    sight.details,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 20, top: 20),
                  constraints: const BoxConstraints(
                    maxWidth: 280,
                    maxHeight: 48,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: FlatButton(
                      onPressed: () {
                        log('Presseed on route button ${sight.name}');
                      },
                      icon: SvgPicture.asset(
                        AppIcons.goRoute,
                        color: Colors.white,
                        width: 24,
                      ),
                      label: const Text(
                        AppStrings.buildRoute,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                  height: 20,
                  indent: 20,
                  endIndent: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlatButton(
                      onPressed: () {
                        log('Presseed on planned button ${sight.name}');
                      },
                      icon: SvgPicture.asset(
                        AppIcons.calendar,
                        color: Colors.grey,
                        width: 20,
                      ),
                      label: const Text(
                        AppStrings.toDoPlane,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        log('Presseed on favorite button ${sight.name}');
                      },
                      icon: SvgPicture.asset(
                        AppIcons.heart,
                        color: Colors.grey,
                        width: 20,
                      ),
                      label: const Text(
                        AppStrings.toFavorite,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomAppBar(
              backgroundColor: Colors.transparent,
              leading: Container(
                padding: const EdgeInsets.only(left: 8, top: 20, bottom: 15),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: customTheme?.cardbackground,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                      color: customTheme?.buttonIcon,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
