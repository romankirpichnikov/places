import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/constants/domain/app_colors.dart';
import 'package:places/constants/domain/app_strings.dart';
import 'package:places/constants/domain/app_text_styles.dart';
import 'package:places/mocks/categories.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final _allCategories = CategoriesData.categories;

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
                        decoration: const BoxDecoration(
                          color: AppColors.lCategoryBackground,
                          borderRadius: BorderRadius.all(Radius.circular(60)),
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
                max: 100000, //100km or 30km reduce constraint?
                divisions: 100,
                onChanged: (values) {
                  setState(() {
                    _rangeValues = values;
                  });
                },
              ),
            ),

            const SizedBox(height: 32),
            const Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: _ShowBotton(),
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

  void _clearSelectedCategories() {
    setState(() {
      for (final category in _allCategories) {
        category.isSelected = false;
      }
      _rangeValues = const RangeValues(100, 5000);
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
        style: TextStyle(
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

class _ShowBotton extends StatelessWidget {
  const _ShowBotton();

  @override
  Widget build(BuildContext context) {
    // add dynamic calculation based on location
    final amount = 190;

    return SizedBox(
      height: 48,
      width: 800,
      // size: const Size.fromHeight(48),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {
          //When we found places we need to show active button otherwise show inactive button
        },
        child: Text('${AppStrings.shopwPlaces} ($amount)'),
      ),
    );
  }
}
