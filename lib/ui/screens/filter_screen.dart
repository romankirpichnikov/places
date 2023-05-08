import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_colors.dart';
import 'package:places/constants/domain/app_strings.dart';
import 'package:places/constants/domain/categories.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late List<bool> _selectedCategories;
  late RangeValues _rangeValues;

  @override
  void initState() {
    super.initState();
    _selectedCategories = List<bool>.filled(Categories.values.length, false);
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
          _buildClearButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                // childAspectRatio: 2.5,
                crossAxisSpacing: 4,
                // mainAxisSpacing: 4,
              ),
              itemCount: Categories.values.length,
              itemBuilder: (context, index) {
                final category = Categories.values[index];
                final selected = _selectedCategories[index];

                return CheckboxListTile(
                  title: Text(category.name),
                  value: selected,
                  onChanged: (value) {
                    setState(() {
                      _selectedCategories[index] = value ?? false;
                    });
                  },
                  // secondary: selected
                  //     ? Icon(Icons.check, color: Theme.of(context).canvasColor)
                  //     : null,
                );
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Distance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SliderTheme(
              data: SliderThemeData(
                activeTrackColor: Theme.of(context).primaryColor,
                inactiveTrackColor: Colors.grey[300],
                thumbColor: Theme.of(context).primaryColor,
                overlayColor:
                    Theme.of(context).primaryColor.withOpacity(0.2), // Optional
                trackHeight: 2,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 24),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDistance(_rangeValues.start),
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  _formatDistance(_rangeValues.end),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: _buildShowButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDistance(double distance) {
    return distance >= 1000
        ? '${(distance / 1000).toStringAsFixed(1)} km'
        : '${distance.toStringAsFixed(0)} m';
  }

  void _clearSelectedCategories() {
    setState(() {
      _selectedCategories.fillRange(0, _selectedCategories.length, false);
      _rangeValues = const RangeValues(100, 5000);
    });
  }

  Widget _buildClearButton() {
    return TextButton(
      onPressed: _clearSelectedCategories,
      child: const Text(
        AppStrings.clear,
        style: TextStyle(
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildShowButton() {
    return ElevatedButton(
      onPressed: () {
        //When we found places we need to show active button otherwise show inactive button
      },
      child: Text('Show'),
    );
  }
}
