
import 'package:marvel_heroes/domain/entities/series.dart';

class SeriesViewModel {

  Series series;

  SeriesViewModel({required this.series});

  String get title => series.title;
  String get thumbnail => "${series.thumbnail.path}.${series.thumbnail.extension}";

}