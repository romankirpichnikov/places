enum Categories {
  hotel,
  restaurant,
  specialPlace,
  park,
  museum,
  cafe,
}

extension CategoriesExtension on Categories {
  String get name {
    switch (this) {
      case Categories.hotel:
        return 'Отель';
      case Categories.restaurant:
        return 'Ресторан';
      case Categories.specialPlace:
        return 'Специальное место';
      case Categories.park:
        return 'Парк';
      case Categories.museum:
        return 'Музей';
      case Categories.cafe:
        return 'Кафе';
      default:
        return 'Другое';
    }
  }
}
