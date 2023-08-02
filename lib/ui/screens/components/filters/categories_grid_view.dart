import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/constants/domain/app_colors.dart';
import 'package:places/domain/category.dart';

class CategoriesGridView extends StatelessWidget {
  final List<Category> categories;
  final Function(Category) onTap;

  const CategoriesGridView({
    super.key,
    required this.categories,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];

        return GestureDetector(
          onTap: () {
            onTap(category);
          },
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: category.isSelected
                      ? AppColors.lCategoryBackground
                      : AppColors.lCategoryBackgroundWithOpacity,
                  borderRadius: const BorderRadius.all(Radius.circular(60)),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 34,
                        width: 34,
                        child: SvgPicture.asset(
                          color: AppColors.lightGreen,
                          category.icon,
                        ),
                      ),
                    ),
                    if (category.isSelected)
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
                category.name,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        );
      },
    );
  }
}
