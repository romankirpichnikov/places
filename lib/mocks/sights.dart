import 'package:places/constants/domain/sight_types.dart';
import 'package:places/domain/sight.dart';

class SightsData {
  static final List<Sight> sights = [
    sight1,
    sight2,
    sight3,
    sight4,
    sight5,
  ];

  static final Sight sight1 = Sight(
    name: 'Эйфелева башня',
    lat: 48.858093,
    lon: 2.294694,
    url:
        'https://upload.wikimedia.org/wikipedia/commons/a/a8/Tour_Eiffel_Wikimedia_Commons.jpg',
    details:
        'Символ Франции, одна из самых известных достопримечательностей мира. Была построена в 1889 году в честь столетия Французской революции.',
    type: SightType.architecture,
    workingHours: 'закрыто до 09:00',
    visited: true,
  );

  static final Sight sight2 = Sight(
    name: 'Мачу-Пикчу',
    lat: -13.1631412,
    lon: -72.5450196,
    url:
        'https://upload.wikimedia.org/wikipedia/commons/e/eb/Machu_Picchu%2C_Peru.jpg',
    details:
        'Древний инканский город, расположенный на высоте 2,4 тысяч метров в горах Анды. Построен в XV веке и оставлен без внимания до начала XX века.',
    type: SightType.history,
    workingHours: 'закрыто до 09:00',
    visited: false,
  );

  static final Sight sight3 = Sight(
    name: 'Сиднейский оперный театр',
    lat: -33.8567844,
    lon: 151.2152967,
    url:
        'https://upload.wikimedia.org/wikipedia/commons/7/7c/Sydney_Opera_House_-_Dec_2008.jpg',
    details:
        'Один из самых известных оперных театров в мире, расположенный на побережье Сиднея. Построен в 1973 году и является символом Австралии.',
    type: SightType.culture,
    workingHours: 'закрыто до 09:00',
    visited: false,
  );

  static final Sight sight4 = Sight(
    name: 'Мона Лиза',
    lat: 48.8606111,
    lon: 2.3376435,
    url:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/250px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg',
    details:
        'Шедевр Леонардо да Винчи, находящийся в Лувре в Париже. Картина была написана в начале 16 века и является одним из наиболее известных произведений искусства в мире.',
    type: SightType.art,
    workingHours: 'закрыто до 09:00',
    visited: false,
  );

  static final Sight sight5 = Sight(
    name: 'Гранд-Каньон',
    lat: 36.1069632,
    lon: -112.1125841,
    url:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Grand_Canyon_Hopi_Point_with_rainbow_2013.jpg/320px-Grand_Canyon_Hopi_Point_with_rainbow_2013.jpg',
    details:
        'Огромный каньон в Северной Америке, расположенный в штате Аризона. Это одно из самых известных мест в США, и ежегодно туда приезжают миллионы туристов.',
    type: SightType.nature,
    workingHours: 'закрыто до 09:00',
    visited: false,
  );
}
