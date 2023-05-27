import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/constants/domain/app_colors.dart';
import 'package:places/constants/domain/app_strings.dart';
import 'package:places/constants/domain/app_text_styles.dart';
import 'package:places/mocks/categories.dart';
import 'package:places/mocks/sights.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final _allCategories = CategoriesData.categories;
  int _foundSightsCount = 0;
  bool _isButtonActive = false;

  late RangeValues _rangeValues;

  @override
  void initState() {
    super.initState();
    _rangeValues = const RangeValues(100, 5000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Theme.of(context).canvasColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          _ClearButton(onPressed: _clearSelectedCategories),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.categories,
              style: AppTextStyles.disabledTextSmall,
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: _allCategories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _allCategories[index].isSelected =
                          !_allCategories[index].isSelected;
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          // what is
                          color: _allCategories[index].isSelected
                              ? AppColors.lCategoryBackground
                              : AppColors.dFavoriteBackground,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(60)),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: SizedBox(
                                height: 34,
                                width: 34,
                                child: SvgPicture.asset(
                                  color: AppColors.lightGreen,
                                  _allCategories[index].icon,
                                ),
                              ),
                            ),
                            if (_allCategories[index].isSelected)
                              const Positioned(
                                bottom: 0,
                                right: 0,
                                child: Icon(Icons.check_circle, size: 24),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _allCategories[index].name,
                        // change style
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            // extract to their own widget and correct spaces around text and slider
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.distance,
                  style: AppTextStyles.baseTextBold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'от ${_formatDistance(_rangeValues.start)} ',
                      style: AppTextStyles.baseTextBold,
                    ),
                    Text(
                      'до ${_formatDistance(_rangeValues.end)}',
                      style: AppTextStyles.baseTextBold,
                    ),
                  ],
                ),
              ],
            ),
            SliderTheme(
              data: const SliderThemeData(
                activeTrackColor: AppColors.lightGreen,
                thumbColor: AppColors.white,
                trackHeight: 1,
              ),
              child: RangeSlider(
                values: _rangeValues,
                min: 100, //100m
                max: 100000, //100km
                divisions: 100,
                onChanged: (values) {
                  setState(() {
                    _rangeValues = values;
                  });
                },
                onChangeEnd: (values) {
                  _calculateNearbySightsButton();
                },
              ),
            ),

            const SizedBox(height: 32),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: _ShowBotton(
                  foundSightsCount: _foundSightsCount,
                  isButtonActive: _isButtonActive,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDistance(double distance) {
    return distance >= 1000
        ? '${(distance / 1000).toStringAsFixed(1)} км'
        : '${distance.toStringAsFixed(0)} м';
  }

  void _calculateNearbySightsButton() {
    final sights = SightsData.sights;
    const centerPoint = {'lat': 1, 'lng': 1}; // stub current position

    const kilometersPerDegree = 40000 / 360;

    final minDistanceKm = _rangeValues.start;
    final maxDistanceKm = _rangeValues.end;

    final xFactor =
        math.cos(math.pi * centerPoint['lat']! / 180.0) * kilometersPerDegree;
    var foundSights = 0;

    for (final sight in sights) {
      final xDistance = (centerPoint['lng']! - sight.lon).abs() * xFactor;
      final yDistance =
          (centerPoint['lat']! - sight.lat).abs() * kilometersPerDegree;
      final distance = math.sqrt(xDistance * xDistance + yDistance * yDistance);

      final isInRange = distance >= minDistanceKm && distance <= maxDistanceKm;

      if (isInRange) {
        foundSights++;
      }
    }

    setState(() {
      _foundSightsCount = foundSights;
      _isButtonActive = foundSights > 0;
    });
  }

  void _clearSelectedCategories() {
    setState(() {
      for (final category in _allCategories) {
        category.isSelected = false;
      }
      _rangeValues = const RangeValues(100, 5000);
      _calculateNearbySightsButton();
    });
  }
}

class _ClearButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _ClearButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Text(
        AppStrings.clear,
        // add green colors
        style: TextStyle(
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

class _ShowBotton extends StatelessWidget {
  final bool isButtonActive;
  final int foundSightsCount;

  const _ShowBotton({
    required this.isButtonActive,
    required this.foundSightsCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 800,
      // size: const Size.fromHeight(48),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: isButtonActive ? Colors.green : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: isButtonActive ? () {} : null,
        child: Text('${AppStrings.shopwPlaces} ($foundSightsCount)'),
      ),
    );
  }
}
