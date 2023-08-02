import 'package:places/constants/domain/categories_type.dart';

class Category {
  final CategoriesType type;
  final String name;
  final String icon;

  late bool isSelected;

  Category({
    required this.type,
    required this.name,
    required this.icon,
    required this.isSelected,
  });
}
