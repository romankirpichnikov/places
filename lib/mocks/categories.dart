import 'package:places/constants/domain/app_icons.dart';
import 'package:places/constants/domain/categories_type.dart';
import 'package:places/domain/category.dart';

class CategoriesData {
  static final List<Category> categories = [
    Category(
      type: CategoriesType.hotel,
      name: 'Отель',
      icon: AppIcons.hotel,
      isSelected: false,
    ),
    Category(
      type: CategoriesType.restaurant,
      name: 'Ресторан',
      icon: AppIcons.restaurant,
      isSelected: false,
    ),
    Category(
      type: CategoriesType.specialPlace,
      name: 'Особое место',
      icon: AppIcons.specialPlace,
      isSelected: false,
    ),
    Category(
      type: CategoriesType.park,
      name: 'Парк',
      icon: AppIcons.park,
      isSelected: false,
    ),
    Category(
      type: CategoriesType.museum,
      name: 'Музей',
      icon: AppIcons.museum,
      isSelected: false,
    ),
    Category(
      type: CategoriesType.cafe,
      name: 'Кафе',
      icon: AppIcons.cafe,
      isSelected: false,
    ),
  ];
}
