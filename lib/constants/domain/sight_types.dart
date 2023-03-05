enum SightType {
  architecture,
  history,
  culture,
  art,
  nature,
  other,
}

extension SightTypeExtension on SightType {
  String get name {
    switch (this) {
      case SightType.architecture:
        return 'Архитектура';
      case SightType.history:
        return 'История';
      case SightType.culture:
        return 'Культура';
      case SightType.art:
        return 'Искуство';
      case SightType.nature:
        return 'Природа';
      case SightType.other:
        return 'Другое';
      default:
        return 'Другое';
    }
  }
}
