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

  Sight({
    required this.name,
    required this.lat,
    required this.lon,
    required this.url,
    required this.details,
    required this.type,
    required this.workingHours,
    required this.visited,
  });

  @override
  String toString() {
    return 'Sight{name: $name, lat: $lat, lon: $lon, url: $url, details: $details, type: $type}';
  }
}
