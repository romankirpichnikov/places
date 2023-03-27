import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_strings.dart';
import 'package:places/constants/domain/app_text_styles.dart';
import 'package:places/constants/domain/sight_types.dart';
import 'package:places/domain/sight.dart';
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
                    style: AppTextStyles.lHeavyWeightTitle,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Text(
                        sight.type.name,
                        style: AppTextStyles.boldText,
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
                    style: AppTextStyles.baseText,
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
                  child: const Center(child: Text(AppStrings.buildRoute)),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SizedBox(
                      width: 164,
                      height: 40,
                      child: Center(
                        child: Text(
                          AppStrings.toDoPlane,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 164,
                      height: 40,
                      child: Center(child: Text(AppStrings.toFavorite)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            child: CustomAppBar(
              backgroundColor: Colors.transparent,
              leading: Container(
                padding: const EdgeInsets.only(left: 8, top: 20, bottom: 15),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                      color: Colors.black,
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
