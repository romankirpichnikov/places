import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:places/constants/domain/sight_types.dart';

class Sight {
  String name;
  double lat;
  double lon;
  String url;
  String details;
  SightType type;
  String workingHours;
  bool visited;
  DateTime? date;

  Sight({
    required this.name,
    required this.lat,
    required this.lon,
    required this.url,
    required this.details,
    required this.type,
    required this.workingHours,
    required this.visited,
    DateTime? date,
  }) : date = date ?? DateTime.now();

  @override
  String toString() {
    return 'Sight{name: $name, lat: $lat, lon: $lon, url: $url, details: $details, type: $type}';
  }

  String visitedDate() {
    return 'Цель достигнута ${_formatDate(date)}';
  }

  String planedDate() {
    return 'Запланировано на ${_formatDate(date)}';
  }

  String _formatDate(DateTime? date) {
    initializeDateFormatting('ru');
    final formatter = DateFormat('d MMMM y', 'ru');

    return formatter.format(date!);
  }
}
