import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_colors.dart';
import 'package:places/constants/domain/app_strings.dart';
import 'package:places/constants/domain/app_text_styles.dart';
import 'package:places/mocks/categories.dart';
import 'package:places/ui/screens/components/filters/categories_grid_view.dart';
import 'package:places/ui/screens/components/filters/clear_button.dart';
import 'package:places/ui/screens/components/filters/distance_slider.dart';
import 'package:places/ui/screens/components/filters/show_button.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';
import 'package:places/utils/nearby_sights_util.dart';

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
          ClearButton(onPressed: _clearSelectedCategories),
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
            CategoriesGridView(
              categories: _allCategories,
              onTap: (category) {
                setState(() {
                  category.isSelected = !category.isSelected;
                });
              },
            ),
            const SizedBox(height: 16),
            DistanceSlider(
              rangeValues: _rangeValues,
              onChanged: (values) {
                setState(() {
                  _rangeValues = values;
                });
              },
              onChangeEnd: (values) {
                _foundSightsCount = calculateNearbySights(values);
                _isButtonActive = _foundSightsCount > 0;
              },
            ),
            const SizedBox(height: 32),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ShowButton(
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

  void _clearSelectedCategories() {
    setState(() {
      for (final category in _allCategories) {
        category.isSelected = false;
      }
      _rangeValues = const RangeValues(100, 5000);
      _foundSightsCount = calculateNearbySights(_rangeValues);
      _isButtonActive = false;
    });
  }
}
